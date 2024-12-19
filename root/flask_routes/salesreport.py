from flask import  Blueprint,request
import mysql.connector
from flask_cors import cross_origin
import os
from dotenv import load_dotenv
load_dotenv()
app_file7= Blueprint('app_file7',__name__)
from root.auth.check import token_auth



@app_file7.route("/saleshistory", methods=["POST"])
@cross_origin()
def stats():
    try:
        mydb = mysql.connector.connect(host=os.getenv('host'), user=os.getenv('user'), password=os.getenv('password'))
        cursor = mydb.cursor(buffered=True)
        database_sql = "USE {};".format(os.getenv('database'))
        cursor.execute(database_sql)
        json = request.get_json()
        if "token" not in json  or not any([json["token"]])  or json["token"]=="":
            data = {"error":"No token provided."}
            return data,400
        token = json["token"]
        if not token_auth(token):
            data = {"error":"Invalid token."}
            return data,400
        if "outlet" not in json or "dateStart" not in json or "dateEnd" not in json:
            data = {"error":"Some fields are missing"}
            return data,400
        outlet = json["outlet"]
        startDate = json["dateStart"]
        endDate = json["dateEnd"]
        orderHistory =f"""SELECT Date,bill_no,(Total-serviceCharge-VAT) as 'Subtotal', Outlet_OrderID as id,serviceCharge, VAT,  Total, DiscountAmt, PaymentMode, GuestName FROM `tblorderhistory` where Date BETWEEN %s and %s and Outlet_Name =%s and not bill_no='' """
        cursor.execute(orderHistory,(
            startDate,endDate,outlet,
        ),)
        result = cursor.fetchall()
        if result == []:
            data = {"error":"No data available."}
            return data,400
        row_headers=[x[0] for x in cursor.description] 
        json_data=[]
        for res in result:
            json_data.append(dict(zip(row_headers,res)))
        statsSql =f"""SELECT SUM(DiscountAmt) AS DiscountAmountSum, SUM(Total-serviceCharge-VAT) AS SubtotalAmountSum, SUM(Total) AS TotalSum, SUM(VAT) AS VatSum, SUM(serviceCharge) as ServiceChargeSum,SUM(NoOfGuests) as TotalGuestsServed,COUNT(idtblorderHistory) AS TotalOrders, COUNT(DISTINCT Date) AS DaysOperated  FROM `tblorderhistory` where Date BETWEEN %s and %s and Outlet_Name =%s and not bill_no=''"""
        cursor.execute(statsSql,(startDate,endDate,outlet,),)
        statsResult = cursor.fetchall()
        Stats_json_data=[]
        if statsResult == []:
            Stats_json_data[0]["orderDetails"]= {"error":"No data available."}
        else:
            row_headers=[x[0] for x in cursor.description] 
            for res in statsResult:
                Stats_json_data.append(dict(zip(row_headers,res)))
            Stats_json_data[0]["orderDetails"]= json_data
        items_food_Sql =f"""SELECT a.Description, a.itemName, sum(a.count)  as quantity, a.itemRate as itemrate, sum(a.Total) as total,a.ItemType FROM tblorder_detailshistory a, tblorderhistory b WHERE  a.ItemType='Food'  and  a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!=''  group by a.ItemName,a.Description  order by a.Description """
        cursor.execute(items_food_Sql,(outlet,startDate,endDate,),)
        items_foodResult = cursor.fetchall()
        items_food_json_data=[]
        if items_foodResult == []:
            items_food_json_data["Data"] = {"error":"No data available."}
        row_headers=[x[0] for x in cursor.description] 
        for res in items_foodResult:
            items_food_json_data.append(dict(zip(row_headers,res)))
        items_beverage_Sql =f"""SELECT a.Description, a.itemName, sum(a.count)  as quantity, a.itemRate as itemrate, sum(a.Total) as total,a.ItemType FROM tblorder_detailshistory a, tblorderhistory b WHERE  a.ItemType='Beverage'  and  a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!=''  group by a.ItemName,a.Description  order by a.Description """
        cursor.execute(items_beverage_Sql,(outlet,startDate,endDate,),)
        items_beverageResult = cursor.fetchall()
        if items_beverageResult == []:
            items_beverage_json_data= {"error":"No data available."}
        else:
            row_headers=[x[0] for x in cursor.description] 
            items_beverage_json_data=[]
            for res in items_beverageResult:
                items_beverage_json_data.append(dict(zip(row_headers,res)))
        items_sum_Sql =f"""SELECT (SELECT sum(a.total) as quantity FROM tblorder_detailshistory a, tblorderhistory b WHERE a.ItemType='Beverage'  and a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!='') as beveragetotal, 
                        (SELECT sum( a.count) FROM tblorder_detailshistory a, tblorderhistory b WHERE a.ItemType='Beverage'  and a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!='')as beveragequantity , 
                        (SELECT sum(a.total) as quantity FROM tblorder_detailshistory a, tblorderhistory b WHERE a.ItemType='Food'  and a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!='') as foodtotal, 
                        (SELECT sum( a.count) FROM tblorder_detailshistory a, tblorderhistory b WHERE a.ItemType='Food'  and a.order_ID = b.idtblorderHistory and b.Outlet_Name =%s and b.Date BETWEEN %s and %s and b.bill_no!='')as foodquantity"""
        cursor.execute(items_sum_Sql,(outlet,startDate,endDate,outlet,startDate,endDate,outlet,startDate,endDate,outlet,startDate,endDate,),)
        items_sumResult = cursor.fetchall()
        if items_sumResult == []:
            items_sum_json_data = {"error":"No data available."}
        else:
            items_sum_json_data=[]
            row_headers=[x[0] for x in cursor.description] 
            for res in items_sumResult:
                items_sum_json_data.append(dict(zip(row_headers,res)))
        beverageGrouptotalSql= f"""SELECT sum(a.Total) as groupTotal, a.Description as groupName FROM tblorder_detailshistory a, tblorderhistory b WHERE  b.Outlet_Name =%s and b.Date BETWEEN %s and %s and a.ItemType='Beverage'  and  a.order_ID = b.idtblorderHistory and b.bill_no!=''  group by a.Description ORDER BY sum(a.Total)  DESC"""
        cursor.execute(beverageGrouptotalSql,(outlet,startDate,endDate,),)
        beverageGroupResult = cursor.fetchall()        
        if beverageGroupResult == []:
            beverageGroup_json_data = {"error":"No data available."}
        else:
            beverageGroup_json_data=[]
            row_headers=[x[0] for x in cursor.description] 
            for res in beverageGroupResult:
                beverageGroup_json_data.append(dict(zip(row_headers,res)))
        foodGrouptotalSql= f"""SELECT sum(a.Total) as groupTotal, a.Description as groupName FROM tblorder_detailshistory a, tblorderhistory b WHERE   b.Outlet_Name =%s and b.Date BETWEEN %s and %s and a.ItemType='Food'  and  a.order_ID = b.idtblorderHistory and b.bill_no!=''  group by a.Description ORDER BY sum(a.Total)  DESC"""
        cursor.execute(foodGrouptotalSql,(outlet,startDate,endDate,),)
        foodGroupResult = cursor.fetchall()        
        if foodGroupResult == []:
            foodGroup_json_data = {"error":"No data available."}
        else:
            foodGroup_json_data=[]
            row_headers=[x[0] for x in cursor.description] 
            for res in foodGroupResult:
                foodGroup_json_data.append(dict(zip(row_headers,res)))
        itemsumDetailsJson={"itemSum":items_sum_json_data,"food":items_food_json_data,"foodGroup":foodGroup_json_data,"beverage":items_beverage_json_data,"beverageGroup":beverageGroup_json_data}
        Stats_json_data[0]["itemDetails"]= itemsumDetailsJson
        mydb.close()
        return Stats_json_data[0]
    except Exception as error:
        data ={'error':str(error)}
        return data,400
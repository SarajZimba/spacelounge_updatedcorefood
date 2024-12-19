from flask import  Blueprint,request
import mysql.connector
from flask_cors import cross_origin
import os
from dotenv import load_dotenv
load_dotenv()
app_file8= Blueprint('app_file8',__name__)


@app_file8.route("/postsales", methods=["POST"])
@cross_origin()
def stats():
    try:
        mydb = mysql.connector.connect(host=os.getenv('host'), user=os.getenv('user'), password=os.getenv('password'))
        cursor = mydb.cursor(buffered=True)
        database_sql = "USE {};".format(os.getenv('database'))
        cursor.execute(database_sql)
        data = request.get_json()
        sql = f"""INSERT INTO tblorderhistory (Outlet_OrderID,Employee,Table_No,NoOfGuests,Start_Time,End_Time,State,Type,Discounts,Date,bill_no,Total,serviceCharge,VAT,DiscountAmt,PaymentMode,fiscal_year,GuestName,Outlet_Name,billPrintTime,guestID,guestEmail,guestPhone,guestAddress) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
        sql2 = f"""INSERT INTO tblorder_detailshistory (order_ID,ItemName,itemRate,Total,ItemType,Description,discountExempt,count)VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"""
        cursor.execute(
        sql,
        (
            data["OrderID"],
            data["Employee"],
            data["TableNo"],
            data["noofGuest"],
            data["start_Time"],
            data["end_Time"],
            data["state"],
            data["type"],
            data["discounts"],
            data["date"],
            data["bill_No"],
            data["Total"],
            data["serviceCharge"],
            data["VAT"],
            data["discountAmt"],
            data["paymentMode"],
            data["fiscal_Year"],
            data["GuestName"],
            data["Outlet_Name"],
            data["billPrintTime"],
            data["guestID"],
            data["guestEmail"],
            data["guestPhone"],
            data["guestAddress"],
            
        ),
        )
        mydb.commit()
        if data["paymentMode"]=='Credit':
            creditSql=f"""INSERT INTO CreditHistory(`outetName`,`Date`, `customerName`,`guestID`,`creditState`,`Outlet_OrderID`,`Amount`) VALUES (%s,%s,%s,%s,%s,%s,'0.00')"""
            cursor.execute(creditSql,(data["Outlet_Name"],data["date"],data["GuestName"],data["guestID"],'InitialEntry',data["OrderID"],),)
            mydb.commit()
        cursor.execute(
        f"SELECT idtblorderhistory FROM tblorderhistory order by idtblorderhistory desc limit 1;"
        )
        id = cursor.fetchall()
        for data in data["ItemDetailsList"]:
            data["orderID"] = id[0][0]
            listdata = (
            data["orderID"],
            data["itemName"],
            data["ItemRate"],
            data["total"],
            data["ItemType"],
            data["Description"],
            data["disExempt"],
            data["count"],
            )
            try:
                cursor.execute(sql2, listdata)
                mydb.commit()
            except Exception as e:
                data={"error":str(e)}
                return data,400
            
        mydb.close()
        data = {"success":"Data posted successfully"}
        return data
    except Exception as error:
        data ={'error':str(error)}
        return data,400
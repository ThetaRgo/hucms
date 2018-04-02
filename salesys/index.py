#!/usr/bin/env python
# encoding:utf-8
# @Time   : 2018/3/25
# @Author : 茶葫芦
# @Site   : 
# @File   : index.py

import json
from BaseHandler import BaseHandler
import tornado
import time
import uuid
from response_code import RET
import hashlib


#####################################################################################
#################################### 页面请求处理 #####################################
#####################################################################################

class pageindexhdl(BaseHandler):#欢迎页面
    def get(self):
        self.render('index.html',session=self.session)

class pageloginhdl(BaseHandler):#登陆页面
    def get(self):
        #进入登陆界面,原先cookie作废,要求输入用户密码进入
        user_no=self.get_cookie("user_no_cookie","admi")
        # self.clear_cookie("sessionid")
        return self.render('login.html',user_no=user_no)


class pagebilllisthdl(BaseHandler):#销售单列表|添加|查看|修改
    def get(self):
        part_no=self.get_query_argument("part_no","",True)
        zhifu=self.get_query_argument("zhifu","",True)
        stock_out=self.get_query_argument("stock_out","",True)
        wherestr=""
        if part_no:
            wherestr=" part_no = '"+part_no+"'"
        if zhifu:
            if wherestr:
                wherestr=wherestr+ " and "+" is_pay = '"+zhifu+"'"
            else:
                wherestr=" is_pay = '"+zhifu+"'"
        if stock_out:
            if wherestr:
                wherestr=wherestr+ " and "+" stock_out = '"+stock_out+"'"
            else:
                wherestr=" stock_out = '"+stock_out+"'"
        if wherestr:
            wherestr=" where "+wherestr
        # print "wherestr:"+wherestr
        try:
            querystr="select bill_id,part_no,bill_price,bill_qty,cust_name,cust_tel,cust_email,bill_date,is_pay,stock_out,bill_person from h_bill"+wherestr
            rows=self.db.query(querystr)
        except Exception as e:
            self.write("%s",e)
        self.render("billList.html",session=self.session,rows=rows,part_no=part_no,zhifu=zhifu,stock_out=stock_out)
class pagebilladdhdl(BaseHandler):
    def get(self):
        self.render("billAdd.html", session=self.session)
class pagebillviewhdl(BaseHandler):
    def get(self):
        bill_id=self.get_query_argument("bill_id","",True)
        row=self.db.get("select bill_id,part_no,bill_price,bill_qty,cust_name,cust_tel,cust_email,bill_date,is_pay,stock_out,bill_person from h_bill where bill_id = %(bill_id)s" ,bill_id=bill_id)
        self.render("billView.html", session=self.session,row=row)
class pagebillupdatehdl(BaseHandler):
    def get(self):
        bill_id = self.get_query_argument("bill_id", "", True)
        row = self.db.get(
            "select bill_id,part_no,bill_price,bill_qty,cust_name,cust_tel,cust_email,bill_date,is_pay,stock_out,bill_person from h_bill where bill_id = %(bill_id)s",
            bill_id=bill_id)
        self.render("billUpdate.html", session=self.session,row=row)


class pagestocklisthdl(BaseHandler):#库存列表|添加|查看|修改
    def get(self):
        part_no=self.get_query_argument("part_no","",True)
        wherestr=""
        if part_no:
            wherestr=" part_no = '"+part_no+"'"
        if wherestr:
            wherestr=" where "+wherestr
        # print "wherestr:"+wherestr
        try:
            querystr="select part_no,part_name,market_price,market_on_time,sale_points,stock_qty from h_stock"+wherestr
            rows=self.db.query(querystr)
        except Exception as e:
            print e
        self.render("stockList.html",session=self.session,rows=rows,part_no=part_no)

class pagestockaddhdl(BaseHandler):
    def get(self):
        self.render("stockAdd.html", session=self.session)
class pagestockviewhdl(BaseHandler):
    def get(self):
        part_no = self.get_query_argument("part_no", "", True)
        row = self.db.get("select part_no,part_name,market_price,market_on_time,sale_points,stock_qty from h_stock where part_no=%(part_no)s",part_no=part_no)
        self.render("stockView.html", session=self.session,row=row)
class pagestockupdatehdl(BaseHandler):
    def get(self):
        part_no = self.get_query_argument("part_no", "", True)
        row = self.db.get(
            "select part_no,part_name,market_price,market_on_time,sale_points,stock_qty from h_stock where part_no=%(part_no)s",
            part_no=part_no)
        self.render("stockUpdate.html", session=self.session,row=row)

class pageuserlisthdl(BaseHandler):#用户列表|添加|查看|修改
    def get(self):
        user_no = self.get_query_argument("user_no", "", True)
        wherestr = ""
        if user_no:
            wherestr = " user_no = '" + user_no + "'"
        if wherestr:
            wherestr = " where " + wherestr
        # print "wherestr:"+wherestr
        try:
            querystr = "select user_no,user_name,user_pass,is_work,user_gender,user_role,user_tel from h_user" + wherestr
            rows = self.db.query(querystr)
        except Exception as e:
            print e
        self.render("userList.html",session=self.session,user_no=user_no,rows=rows)
class pageuseraddhdl(BaseHandler):
    def get(self):
        self.render("userAdd.html", session=self.session)
class pageuserviewhdl(BaseHandler):
    def get(self):
        user_no = self.get_query_argument("user_no", "", True)
        row = self.db.get(
            "select user_no,user_name,user_pass,is_work,user_gender,user_role,user_tel from h_user where user_no=%(user_no)s",
            user_no=user_no)
        self.render("userView.html", session=self.session, row=row)
class pageuserupdatehdl(BaseHandler):
    def get(self):
        user_no = self.get_query_argument("user_no", "", True)
        row = self.db.get(
            "select user_no,user_name,user_pass,is_work,user_gender,user_role,user_tel from h_user where user_no=%(user_no)s",
            user_no=user_no)
        self.render("userUpdate.html", session=self.session, row=row)


class pagepasswordhdl(BaseHandler):#密码修改页面
    def get(self):
        self.render("password.html", session=self.session)








#####################################################################################
#################################### API接口处理 #####################################
#####################################################################################
class apiloginhdl(BaseHandler):
    def post(self, *args, **kwargs):
        user_no=self.json_dict.get("userno")
        user_pass=hashlib.sha1(self.json_dict.get("password")).hexdigest()
        ret=self.db.get("select count(*) as count,user_name from h_user where user_no = %(user_no)s "
                    "and user_pass = %(user_pass)s",user_no=user_no,user_pass=user_pass)

        if ret["count"] > 0:
            #登陆成功,session存入数据库和cookie
            self.sessionid = uuid.uuid4().hex
            self.session = {}
            self.session['user_no']=user_no
            self.session['user_name'] = ret["user_name"]
            self.db.execute("insert into h_session (sessionid,session_data,session_create_time)"
                           "values (%s,%s,%s)",self.sessionid,str(self.session),time.strftime('%Y-%m-%d',time.localtime(time.time())))
            self.set_secure_cookie("sessionid", self.sessionid,expires_days=None) #关闭浏览器失效
            self.set_cookie("user_no_cookie", user_no,expires_days=7)
            return self.write({"errcode": RET.OK, "errmsg": "登陆成功"})
        else:
            return self.write({"errcode": RET.LOGINERR, "errmsg": "登陆失败"})

class apigetinforbypartnohdl(BaseHandler):
    def post(self, *args, **kwargs):
        part_no=self.json_dict.get("part_no","")
        if part_no:
            try:
                ret=self.db.get("select stock_qty from h_stock where part_no = %(part_no)s",part_no=part_no)
                if ret:
                    return self.write({"errcode":RET.OK, "errmsg": "OK", "stock_qty": ret["stock_qty"]})
                else:
                    return self.write({"errcode":RET.OK,"errmsg":"OK", "stock_qty":"商品编码不存在"})
            except Exception as e:
                return self.write({"errcode":RET.DBERR,"errmsg":"DataBaseError"})
        else:
            return self.write({"errcode":RET.PARAMERR,"errmsg":"Input Param Error"})



class apibilladdsavehdl(BaseHandler):
    def post(self, *args, **kwargs):
        part_no=self.json_dict.get("part_no","")
        bill_price=self.json_dict.get("bill_price","")
        bill_qty=self.json_dict.get("bill_qty","")
        cust_name=self.json_dict.get("cust_name","")
        cust_tel=self.json_dict.get("cust_tel","")
        cust_email=self.json_dict.get("cust_email","")
        bill_date=self.json_dict.get("bill_date","")
        is_pay=self.json_dict.get("is_pay","")
        stock_out=self.json_dict.get("stock_out","")
        try:#插入销售单记录
            ret=self.db.execute("insert into h_bill (part_no,bill_price,bill_qty,cust_name,cust_tel,cust_email,bill_date,is_pay,stock_out,bill_person) "
                                "values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",part_no,bill_price,bill_qty,cust_name,cust_tel,cust_email,bill_date,is_pay,stock_out,self.session["user_no"])
            bill_id=ret
            if ret:#销售单记录成功插入后,如果是已出库销售扣减库存
                try:
                    print ("update h_stock set stock_qty =stock_qty - h_bill.bill_qty from h_bill "
                                        "where h_stock.part_no =h_bill.part_no and h_bill.stock_out= 'Y' and h_bill.bill_id = %s  " %bill_id)
                    ret=self.db.execute("update h_stock,h_bill set stock_qty =stock_qty - h_bill.bill_qty "
                                        "where h_stock.part_no =h_bill.part_no and h_bill.stock_out= 'Y' and h_bill.bill_id = %(bill_id)s  ",bill_id=bill_id)
                except Exception as e:
                    print e
                    #如果库存更新失败,将该销售单状态更改为未出库状态,其他信息保存
                    ret = self.db.execute("update h_bill set stock_out ='N' where bill_id=%s ", bill_id)
                    return self.write({"errcode":RET.STOCKERROR,"errmsg":"库存计算出错"})
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
        except Exception as e:
            print e
            return self.write({"errcode":RET.DBERR,"errmsg":"DB ERROR"})

class apibilldeletehdl(BaseHandler):
    def post(self, *args, **kwargs):
        bill_id=self.json_dict.get("bill_id","")
        if bill_id:
            try:
                ret=self.db.execute("delete from h_bill where bill_id = %s",bill_id)
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})

class apibillupdatehdl(BaseHandler):
    def post(self, *args, **kwargs):
        """
        销售单更新并且影响库存,相关更新办法如下:
        1.加上原来扣减了的该款号的库存(作废原单)
        2.对页面更新内容进行响应,按新内容更新该销售单
        3.若是已出库状态,扣减该款号的库存(生效更改后单)
        4.注意事项:理论上上述5步应该具有原子性,但tornadb没有事务操作,此点此处不作要求.
        """
        bill_id=self.json_dict.get("bill_id","")
        part_no=self.json_dict.get("part_no","")
        bill_price=self.json_dict.get("bill_price","")
        bill_qty=self.json_dict.get("bill_qty","")
        cust_name=self.json_dict.get("cust_name","")
        cust_tel=self.json_dict.get("cust_tel","")
        cust_email=self.json_dict.get("cust_email","")
        bill_date=self.json_dict.get("bill_date","")
        is_pay=self.json_dict.get("is_pay","")
        stock_out=self.json_dict.get("stock_out","")
        if bill_id:
            try:#1 只针对状态为已出库的单据
                ret = self.db.execute("update h_stock,h_bill set stock_qty =stock_qty + h_bill.bill_qty "
                                      "where h_stock.part_no =h_bill.part_no and h_bill.stock_out= 'Y' and h_bill.bill_id = %(bill_id)s  ",
                                      bill_id=bill_id)
                #2
                ret=self.db.execute("update h_bill set part_no=%s, bill_price=%s,bill_qty=%s,cust_name=%s,cust_tel=%s,"
                                "cust_email=%s,bill_date=%s,is_pay=%s,stock_out=%s where bill_id=%s",part_no,bill_price,bill_qty,cust_name,
                                cust_tel,cust_email,bill_date,is_pay,stock_out,bill_id)
                #3 只针对状态为已出库的单据
                ret = self.db.execute("update h_stock,h_bill set stock_qty =stock_qty - h_bill.bill_qty "
                                      "where h_stock.part_no =h_bill.part_no and h_bill.stock_out= 'Y' and h_bill.bill_id = %(bill_id)s  ",
                                      bill_id=bill_id)

                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                print e
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})


class apistockaddsavehdl(BaseHandler):
    def post(self, *args, **kwargs):
        part_no=self.json_dict.get("part_no","")
        part_name=self.json_dict.get("part_name","")
        market_price=self.json_dict.get("market_price","")
        market_on_time=self.json_dict.get("market_on_time","")
        sale_points=self.json_dict.get("sale_points","")
        stock_qty=self.json_dict.get("stock_qty","")
        try:
            ret=self.db.get("select count(*) as count from h_stock where part_no=%(part_no)s",part_no=part_no)
            if ret:
                if ret["count"]>0:
                    return self.write({"errcode": RET.KEYEXISTS, "errmsg": "PRIMARY EXISTS"})
                else:
                    try:  # 插库存记录
                        ret = self.db.execute(
                            "insert into h_stock (part_no,part_name,market_price,market_on_time,sale_points,stock_qty) "
                            "values (%s,%s,%s,%s,%s,%s)", part_no, part_name, market_price, market_on_time, sale_points,
                            stock_qty)
                        return self.write({"errcode": RET.OK, "errmsg": "OK"})
                    except Exception as e:
                        print e
                        return self.write({"errcode": RET.DBERR, "errmsg": "DB ERROR"})
        except Exception as e:
            return self.write({"errcode": RET.DBERR, "errmsg": "DB ERROR"})


class apistockdeletehdl(BaseHandler):
    def post(self, *args, **kwargs):
        part_no = self.json_dict.get("part_no", "")
        if part_no:
            try:
                ret = self.db.execute("delete from h_stock where part_no = %s", part_no)
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})

class apistockupdatehdl(BaseHandler):
    def post(self, *args, **kwargs):
        part_no = self.json_dict.get("part_no", "")
        part_name= self.json_dict.get("part_name", "")
        market_price= self.json_dict.get("market_price", "")
        market_on_time= self.json_dict.get("market_on_time", "")
        sale_points= self.json_dict.get("sale_points", "")
        stock_qty= self.json_dict.get("stock_qty", "")
        if part_no:
            try:
                ret = self.db.execute("update h_stock set part_name=%s,market_price=%s,market_on_time=%s,sale_points=%s,stock_qty=%s where part_no = %s", part_name,market_price,market_on_time,sale_points,stock_qty,part_no)
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})



class apiuseraddsavehdl(BaseHandler):
    def post(self, *args, **kwargs):
        user_no=self.json_dict.get("user_no","")
        user_name=self.json_dict.get("user_name","")
        user_pass=hashlib.sha1(self.json_dict.get("user_pass","")).hexdigest()
        user_gender=self.json_dict.get("user_gender","")
        user_role=self.json_dict.get("user_role","")
        user_tel=self.json_dict.get("user_tel","")
        is_work=self.json_dict.get("is_work","")
        try:
            ret=self.db.get("select count(*) as count from h_user where user_no=%(user_no)s",user_no=user_no)
            if ret:
                if ret["count"]>0:
                    return self.write({"errcode": RET.KEYEXISTS, "errmsg": "PRIMARY EXISTS"})
                else:
                    try:  # 插库存记录
                        ret = self.db.execute(
                            "insert into h_user (user_no,user_name,user_pass,user_gender,user_role,user_tel,is_work) "
                            "values (%s,%s,%s,%s,%s,%s,%s)", user_no,user_name,user_pass,user_gender,user_role,user_tel,is_work)
                        return self.write({"errcode": RET.OK, "errmsg": "OK"})
                    except Exception as e:
                        print e
                        return self.write({"errcode": RET.DBERR, "errmsg": "DB ERROR"})
        except Exception as e:
            return self.write({"errcode": RET.DBERR, "errmsg": "DB ERROR"})

class apiuserdeletehdl(BaseHandler):
    def post(self, *args, **kwargs):
        user_no = self.json_dict.get("user_no", "")
        if user_no:
            try:
                ret = self.db.execute("delete from h_user where user_no = %s", user_no)
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})


class apiuserupdatehdl(BaseHandler):
    def post(self, *args, **kwargs):
        user_no=self.json_dict.get("user_no","")
        user_name=self.json_dict.get("user_name","")
        user_gender=self.json_dict.get("user_gender","")
        user_role=self.json_dict.get("user_role","")
        user_tel=self.json_dict.get("user_tel","")
        is_work=self.json_dict.get("is_work","")
        if user_no:
            try:
                ret = self.db.execute("update h_user set user_name=%s,user_gender=%s,user_role=%s,user_tel=%s,is_work=%s where user_no=%s", user_name,user_gender,user_role,user_tel,is_work,user_no)
                return self.write({"errcode": RET.OK, "errmsg": "OK"})
            except Exception as e:
                return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
        else:
            return self.write({"errcode": RET.PARAMERR, "errmsg": "input Paramer Error"})

class apipwdchangehdl(BaseHandler):
    def post(self, *args, **kwargs):
        old_pwd=hashlib.sha1(self.json_dict.get("oldPassword","")).hexdigest()
        new_pwd = hashlib.sha1(self.json_dict.get("newPassword", "")).hexdigest()
        #旧密码正确,更新成新密码
        try:
            ret = self.db.get("select count(*) as count,user_name from h_user where user_no = %(user_no)s "
                              "and user_pass = %(user_pass)s", user_no=self.session["user_no"], user_pass=old_pwd)
            if ret["count"]>0:
                try:
                    ret_update=self.db.execute("update h_user set user_pass=%(new_pwd)s where user_no=%(user_no)s",new_pwd=new_pwd,user_no=self.session["user_no"])
                    return self.write({"errcode": RET.OK, "errmsg": "OK"})
                except Exception as e:
                    return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})
            else:
                return self.write({"errcode": RET.PWDERR, "errmsg": "Password Error"})
        except Exception as e:
            return self.write({"errcode": RET.DBERR, "errmsg": "DB Error"})



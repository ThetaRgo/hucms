#!/usr/bin/env python
# encoding:utf-8
# @Time   : 2018/3/26
# @Author : 茶葫芦
# @Site   : 
# @File   : urls.py

import index
from tornado.options import define, options
import os
from tornado.web import StaticFileHandler

define('port', 9110, type=int, help="服务器运行端口")

rute_urls = [(r'/index', index.pageindexhdl),  # 系统主界面
             (r'/login', index.pageloginhdl),  # 登陆页面

             (r'/billList', index.pagebilllisthdl),  # 销售单管理页面
             (r'/billAdd', index.pagebilladdhdl),  # 销售单添加页面
             (r'/billView', index.pagebillviewhdl),  # 销售单查看页面
             (r'/billUpdate', index.pagebillupdatehdl),  # 销售单更新页面

             (r'/stockList', index.pagestocklisthdl),  # 库存管理页面
             (r'/stockAdd', index.pagestockaddhdl),  # 库存铺入页面
             (r'/stockView', index.pagestockviewhdl),  # 库存查看页面
             (r'/stockUpdate', index.pagestockupdatehdl),  # 库存更新页面

             (r'/userList', index.pageuserlisthdl),  # 用户管理页面
             (r'/userAdd', index.pageuseraddhdl),  # 用户添加页面
             (r'/userView', index.pageuserviewhdl),  # 用户查看页面
             (r'/userUpdate', index.pageuserupdatehdl),  # 用户更新页面

             (r'/password', index.pagepasswordhdl),  # 密码管理页面





             (r'/api/login', index.apiloginhdl),  # 登陆接口
             (r'/api/getinforbypartno', index.apigetinforbypartnohdl),  # 根据商品编号取商品名称及当前库存
             (r'/api/billaddsave', index.apibilladdsavehdl),  # 订单新增保存
             (r'/api/billdelete',index.apibilldeletehdl), #订单删除
             (r'/api/billupdate', index.apibillupdatehdl),  # 订单修改



             (r'/api/stockaddsave', index.apistockaddsavehdl),  # 库存记录新增保存
             (r'/api/stockdelete', index.apistockdeletehdl),  # 库存记录删除
             (r'/api/stockupdate', index.apistockupdatehdl),  # 库存记录更改

             (r'/api/useraddsave', index.apiuseraddsavehdl),  # 用户记录新增保存
             (r'/api/userdelete', index.apiuserdeletehdl),  # 用户记录删除
             (r'/api/userupdate', index.apiuserupdatehdl),  # 用户记录更改

             (r'/api/pwdchange', index.apipwdchangehdl),  # 用户记录更改
             ]

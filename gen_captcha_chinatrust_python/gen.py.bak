# 成功範例
import requests
import shutil

rs=requests.session()
res=rs.get('https://www.ctbcbank.com/CTCBPortalWeb/servlets/LoginCaptchaServlet', stream=True) # ,verify=False
f=open("check.jpeg","wb")
f.write(res.content)
f.close()


#-*- coding: utf-8 -*-

from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
from cStringIO import StringIO
import datetime
import time
import re
#as3:/usr/local/lib/python2.7/site-packages# cat sitecustomize.py
# encoding=utf8  
import sys  



class PdfToText(object):
    ROBOT_LIBRARY_SCOPE = 'Global'

    def __init__(self):
        print 'pdt to text library'

    def convert_pdf_to_txt(self,path,LengthofService):
        mydate = datetime.datetime.utcnow()
        print(mydate.strftime("%-m/%-d/%y"))
        #path = 'Comp_CS_OG.pdf'
        rsrcmgr = PDFResourceManager()
        retstr = StringIO()
        reload(sys)  
        sys.setdefaultencoding('utf8')
        codec = 'utf-8'
        laparams = LAParams()
        device = TextConverter(rsrcmgr, retstr, codec=codec, laparams=laparams)
        fp = file(path, 'rb')
        interpreter = PDFPageInterpreter(rsrcmgr, device)
        password = ""
        maxpages = 0
        caching = True
        pagenos=set()
        for page in PDFPage.get_pages(fp, pagenos, maxpages=maxpages, password=password,caching=caching, check_extractable=True):
            interpreter.process_page(page)
        fp.close()
        device.close()
        str = retstr.getvalue()
        retstr.close()

        pattern = re.compile(r'((.|\n)*)LengthofService')
        mydate = datetime.datetime.utcnow()
        getdate = mydate.strftime("%m/%d/%y")
        date_1 = datetime.datetime.strptime(getdate, "%m/%d/%y")
        end_date = date_1 + datetime.timedelta(days=0)
        new_date_US_1 = end_date.strftime("%-m/%-d/20%y")
        print new_date_US_1

        mydate1 = datetime.datetime.utcnow()
        getdate1 = mydate1.strftime("%m/%d/%y")
        date_2 = datetime.datetime.strptime(getdate1, "%m/%d/%y")
        end_date_2 = date_2 + datetime.timedelta(days=1)
        new_date_US_2 = end_date_2.strftime("%-m/%-d/20%y")
        print new_date_US_2


        mydate2 = datetime.datetime.utcnow()
        getdate2 = mydate2.strftime("%m/%d/%y")
        date_3 = datetime.datetime.strptime(getdate1, "%m/%d/%y")
        end_date_3 = date_3 + datetime.timedelta(days=2)
        new_date_US_3 = end_date_3.strftime("%-m/%-d/20%y")
        print new_date_US_3

        replacetext = str
        #replacetext = LengthofService
        #replacetext = pattern.sub("", str)
        replacetext = replacetext.replace(new_date_US_1,'') 
        replacetext = replacetext.replace(new_date_US_2,'')
        replacetext = replacetext.replace(new_date_US_3,'')
        replacetext = replacetext.replace("'",'')
        replacetext = replacetext.replace("=",'')
        replacetext = replacetext.replace("^",'')
        replacetext = replacetext.replace(":",'')
        replacetext = replacetext.replace("",'')
        replacetext1 = pattern.sub("", replacetext)
        #replacetext = replacetext.replace(LengthofService,'')

        return replacetext1

    def count_pdf_pages(self,path):
        rsrcmgr = PDFResourceManager()
        retstr = StringIO()
        codec = 'utf-8'
        laparams = LAParams()
        device = TextConverter(rsrcmgr, retstr, codec=codec, laparams=laparams)
        fp = file(path, 'rb')
        interpreter = PDFPageInterpreter(rsrcmgr, device)
        password = ""
        maxpages = 0
        caching = True
        pagenos=set()
        pagenumber=0
        for page in enumerate(PDFPage.get_pages(fp, pagenos, maxpages=maxpages, password=password,caching=caching, check_extractable=True)):
            pagenumber=pagenumber+1
        fp.close()
        device.close()
        return pagenumber
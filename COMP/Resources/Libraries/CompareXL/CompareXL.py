    
import xlrd
from xlutils.copy import copy
from xlrd import *
# import py_compile
# py_compile.compile('CompareXlrd.py')
#----------------------------------------------------------------------

class CompareXL(object):

    ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

    global compgroup
    global comp

    def __init__(self):
            print "write to excel file"

    """ open excel workbook to write something """        

    def open_file_write(self, workbook1, workbook2):
        """ Purpose: This enables you to write any data to workbook sheet 
        for now it's hard coded but can be extended """
        w = copy(open_workbook(workbook1,formatting_info=True))

        #w.get_sheet(0).write(6, 0, "")
        #w.get_sheet(0).write(6, 1, "")
        w.get_sheet(0).write(24, 1, "")
        w.get_sheet(0).write(26, 3, "")
        w.get_sheet(0).write(27, 3, "")
        w.get_sheet(0).write(28, 3, "")
        w.get_sheet(0).write(29, 3, "")
        w.get_sheet(0).write(30, 3, "")
        w.get_sheet(0).write(31, 3, "")
        w.get_sheet(0).write(3, 1, "")
        w.save(workbook2)


    """   group list by number of items   """
    
    def compgroup(lst, n):
        """group([0,3,4,10,2,3], 3) => [(0,3,4), (10,2,3)]
        
        Group a list into consecutive n-tuples. Incomplete tuples are
        discarded e.g.
        
        >>> group(range(10), 3)
        [(0, 1, 2), (3, 4, 5), (6, 7, 8)]
        """
        return zip(*[lst[i::n] for i in range(n)])


    def ExcelOne(self,excelworkbook1):
        """  ExcelOne('UC005_GBP_1') 
        must have excel file path either in project directory or provide the path in cell
        in RIDE IDE  """
        print "setting up workbook1"
        #(excelworkbook1) = 'UC005_GBP_1.xls'
    
    

    def ExcelTwo(self,excelworkbook2):
        """  ExcelTwo('UC005_GBP_2') 
        must have excel file path either in project directory or provide the path in cell
        in RIDE IDE  """
        print "setting up workbook2"
       #excelworkbook2="UC005_GBP_12.xls"
        #(excelworkbook2) = 'UC005_GBP_12.xls'
    

    """      function to open an Excel File """

    def open_file(self,path):
    
    
        # Open and read an Excel file
        
        book = xlrd.open_workbook(path)
        
        # print number of sheets
        print book.nsheets
     
        # print sheet names
        print book.sheet_names()
     
        # get the first worksheet
        first_sheet = book.sheet_by_index(0)
        # get the number of rows
        nrows=book.sheet_by_index(0).nrows
        #get the number of columns
        ncols=book.sheet_by_index(0).ncols
        #print row and column numbers
        print "total rows: ",nrows,"total columns: ",ncols

        #define a list that contains the data
        lst=[]
        
        # read cell values
        for row in range(0,nrows):
            for col in range(0,ncols):
                cell=book.sheet_by_index(0).cell(row,col)
                print "cell row:", row,"cell column:", col,"cell value:",cell.value
        #append to list item
                lst.append(cell.value)
        
        #group list items by the number of columns
            #try:
        each_row_item=compgroup(lst,ncols)
            
        for each_cell in each_row_item:
            print each_cell[0],each_cell[1],each_cell[2]
            #return excel file content as a list
        return lst
            #print "Testing2"
        #except:
        """    function to compare two lists    """
            #print each_cell[0],each_cell[1],each_cell[2] 

    def comp(list1, list2):
        print "This is list1: ", list1
        print "This is list2: ", list2
        if list1 == list2:
            return True
        else:
            return False
            raise ValueError('The length does not match')
        # if len(set(list1).intersection(set(list2))) > 0:
        #     print list1
        #     print list2
        #     raise ValueError('The length does not match')
        #     return False
        # else:
        #     return True

    """         function to compare content of two excel books  """

    def compare_content(self,content1,content2):
        returnvalue = 0
        if(len(content1)==len(content2)):
            print "Book1 and Book2 have the same number of items"
            #raise AssertionError("file %r len %d is different ")
        #if(len(content1)==len(content2)):       
            returnvalue=True
        else:     
            raise ValueError('Book1 and Book2 Do Not have the same number of items')
            print "Book1 and Book2 Do Not have the same number of items"
            returnvalue=False
        result=comp(content1,content2)
        if(result==True):
            print result, " Contents are the same"
            returnvalue=True
        else:          
            raise ValueError('Contents are different')
            print result, " Contents are different"
            returnvalue=False
    #----------------------------------------------------------------------
        if __name__ == "__main__":
            #str(ExcelOne("UC005_GBP_1.xls"))
            #str(ExcelTwo("UC005_GBP_12.xls"))
            print "   ------- Writing Empty Spaces ----------- "
            open_file_write(workbook1,workbook2)
            book1_content=open_file(excelworkbook1)
            book2_content=open_file(excelworkbook2)
            print "   -------  Comparison Result  ------------ "
            compare_content(book1_content,book2_content)
            return returnvalue

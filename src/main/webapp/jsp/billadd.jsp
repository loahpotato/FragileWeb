<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>You are at:</strong>
         <span>Order Management page >> Order Addition page</span>
     </div>
     <div class="productAdd">
         <form id="billForm" name="billForm" method="post" action="${pageContext.request.contextPath }/jsp/bill.do">
             <input type="hidden" name="method" value="add">
             <div class="">
                 <label for="billCode">BillCode:</label>
                 <input type="text" name="billCode" class="text" id="billCode" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productName">ProductName:</label>
                 <input type="text" name="productName" id="productName" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productUnit">CurrencyCode:</label>
                 <input type="text" name="productUnit" id="productUnit" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productCount">Quantity:</label>
                 <input type="text" name="productCount" id="productCount" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="totalPrice">Total Amount:</label>
                 <input type="text" name="totalPrice" id="totalPrice" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label >Developer:</label>
                 <select name="productId" id="productId">
		         </select>
				 <font color="red"></font>
             </div>
             <div>
                 <label >Whether payment:</label>
                 <input type="radio" name="isPayment" value="1" checked="checked">Non-Payment
				 <input type="radio" name="isPayment" value="2" >Paid
             </div>
             <div class="productAddBtn">
                  <input type="button" name="add" id="add" value="Save">
				  <input type="button" id="back" name="back" value="Back" >
             </div>
         </form>
     </div>
 </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billadd.js"></script>
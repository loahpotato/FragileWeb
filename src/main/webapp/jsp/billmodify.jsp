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
				<input type="hidden" name="method" value="modifysave">
				<input type="hidden" name="id" value="${bill.id }">
                <div class="">
                    <label for="billCode">BillCode:</label>
                    <input type="text" name="billCode" id="billCode" value="${bill.billCode }" readonly="readonly"> 
                </div>
                <div>
                    <label for="productName">ProductName:</label>
                    <input type="text" name="productName" id="productName" value="${bill.productName }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productUnit">CurrencyCode:</label>
                    <input type="text" name="productUnit" id="productUnit" value="${bill.productUnit }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productCount">Quantity:</label>
                    <input type="text" name="productCount" id="productCount" value="${bill.productCount }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="totalPrice">Total Amount:</label>
                    <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productId">Developer:</label>
                    <input type="hidden" value="${bill.productId }" id="pid" />
					<select name="productId" id="productId">
		        	</select>
					<font color="red"></font>
                </div>
                <div>
                    <label >Whether payment:</label>
                    <c:if test="${bill.isPayment == 1 }">
						<input type="radio" name="isPayment" value="1" checked="checked">Non-Payment
						<input type="radio" name="isPayment" value="2" >Paid
					</c:if>
					<c:if test="${bill.isPayment == 2 }">
						<input type="radio" name="isPayment" value="1">Non-Payment
						<input type="radio" name="isPayment" value="2" checked="checked">Paid
					</c:if>
                </div>
                <div class="productAddBtn">
                  <input type="button" name="save" id="save" value="Save">
				  <input type="button" id="back" name="back" value="Back" >
              	</div>
            </form>
        </div>

    </div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billmodify.js"></script>
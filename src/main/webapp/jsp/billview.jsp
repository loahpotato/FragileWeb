<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
     <div class="location">
         <strong>You are at:</strong>
         <span>Order Management page >> Information Check</span>
     </div>
     <div class="productView">
         <p><strong>BillCode:</strong><span>${bill.billCode }</span></p>
         <p><strong>ProductName:</strong><span>${bill.productName }</span></p>
         <p><strong>CurrencyCode:</strong><span>${bill.productUnit }</span></p>
         <p><strong>Quantity:</strong><span>${bill.productCount }</span></p>
         <p><strong>Total Amount:</strong><span>${bill.totalPrice }</span></p>
         <p><strong>Developer:</strong><span>${bill.productName }</span></p>
         <p><strong>Whether payment:</strong>
         	<span>
         		<c:if test="${bill.isPayment == 1}">Non-Payment</c:if>
				<c:if test="${bill.isPayment == 2}">Paid</c:if>
			</span>
		</p>
		<div class="productAddBtn">
         	<input type="button" id="back" name="back" value="Back" >
        </div>
     </div>
 </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billview.js"></script>
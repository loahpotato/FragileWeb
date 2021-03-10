<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>You are at:</strong>
           <span>Order Management page</span>
       </div>
       <div class="search">
       <form method="get" action="${pageContext.request.contextPath }/jsp/bill.do">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>ProductName</span>
			<input name="queryProductName" type="text" value="${queryProductName }">
			 
			<span>Developer:</span>
			<select name="queryProductId">
				<c:if test="${productList != null }">
				   <option value="0">--Please Select--</option>
				   <c:forEach var="product" items="${productList}">
				   		<option <c:if test="${product.id == queryProductId }">selected="selected"</c:if>
				   		value="${product.id}">${product.proName}</option>
				   </c:forEach>
				</c:if>
       		</select>
			 
			<span>Whether payment:</span>
			<select name="queryIsPayment">
				<option value="0">--Please Select--</option>
				<option value="1" ${queryIsPayment == 1 ? "selected=\"selected\"":"" }>Non-Payment</option>
				<option value="2" ${queryIsPayment == 2 ? "selected=\"selected\"":"" }>Paid</option>
       		</select>
			
			 <input	value="Query" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/jsp/billadd.jsp">Add Order</a>
		</form>
       </div>

      <table class="productTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="10%">BillCode</th>
              <th width="20%">ProductName</th>
              <th width="10%">Developer</th>
              <th width="10%">Order Amount</th>
              <th width="10%">Whether payment</th>
              <th width="10%">Creation Date</th>
              <th width="30%">Operation</th>
          </tr>
          <c:forEach var="bill" items="${billList }" varStatus="status">
				<tr>
					<td>
					<span>${bill.billCode }</span>
					</td>
					<td>
					<span>${bill.productName }</span>
					</td>
					<td>
					<span>${bill.productName}</span>
					</td>
					<td>
					<span>${bill.totalPrice}</span>
					</td>
					<td>
					<span>
						<c:if test="${bill.isPayment == 1}">Non-Payment</c:if>
						<c:if test="${bill.isPayment == 2}">Paid</c:if>
					</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/read.png" alt="Check" title="Check"/></a></span>
					<span><a class="modifyBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="Modify" title="Modify"/></a></span>
					<span><a class="deleteBill" href="javascript:;" billid=${bill.id } billcc=${bill.billCode }><img src="${pageContext.request.contextPath }/images/schu.png" alt="Delete" title="Delete"/></a></span>
					</td>
				</tr>
			</c:forEach>
      </table>
  </div>
</section>

<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>Tip</h2>
        <div class="removeMain">
            <p>Are you sure you really want to delete this order?</p>
            <a href="#" id="yes">Yes</a>
            <a href="#" id="no">No</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/billlist.js"></script>
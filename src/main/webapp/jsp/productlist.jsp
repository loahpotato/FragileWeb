<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>You are at:</strong>
            <span>Product Management page</span>
        </div>
        <div class="search">
        	<form method="get" action="${pageContext.request.contextPath }/jsp/product.do">
				<input name="method" value="query" type="hidden">
				<span>Code:</span>
				<input name="queryProCode" type="text" value="${queryProCode }">
				
				<span>Name:</span>
				<input name="queryProName" type="text" value="${queryProName }">
				
				<input value="Query" type="submit" id="searchbutton">
				<a href="${pageContext.request.contextPath }/jsp/productadd.jsp">Add Product</a>
			</form>
        </div>
        <table class="productTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
				<th width="15%">Image</th>
                <th width="15%">Product Code</th>
                <th width="15%">Product Name</th>
                <th width="10%">Developer</th>
                <th width="10%">Publisher</th>
                <th width="10%">Price</th>
                <th width="10%">CreationDate</th>
                <th width="15%">Operation</th>
            </tr>
            <c:forEach var="product" items="${productList }" varStatus="status">
				<tr>
					<td>
						<span>
							<img src="${pageContext.request.contextPath }/images/product/${product.proFilename }" height ="80">
						</span>
					</td>
					<td>
					<span>${product.proCode }</span>
					</td>
					<td>
					<span>${product.proName }</span>
					</td>
					<td>
					<span>${product.proDeveloper}</span>
					</td>
					<td>
					<span>${product.proPublisher}</span>
					</td>
					<td>
					<span>${product.proPrice}</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${product.creationDate}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewProduct" href="javascript:;" proid=${product.id } proname=${product.proName }><img src="${pageContext.request.contextPath }/images/read.png" alt="Check" title="Check"/></a></span>
					<span><a class="modifyProduct" href="javascript:;" proid=${product.id } proname=${product.proName }><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="Modify" title="Modify"/></a></span>
					<span><a class="deleteProduct" href="javascript:;" proid=${product.id } proname=${product.proName }><img src="${pageContext.request.contextPath }/images/schu.png" alt="Delete" title="Delete"/></a></span>
					<span><a class="modifyPicture" href="${pageContext.request.contextPath }/jsp/product.do?method=image&proid=${product.id }"><img src="${pageContext.request.contextPath }/images/tianjia.png" alt="Add Files" title="Add Files"/></a></span>
					</td>
				</tr>
			</c:forEach>
        </table>
    </div>
</section>

<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>Tip</h2>
       <div class="removeMain" >
           <p>Are you sure you really want to delete this product?</p>
           <a href="#" id="yes">Yes</a>
           <a href="#" id="no">No</a>
       </div>
   </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/productlist.js"></script>

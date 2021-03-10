<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>You are at:</strong>
            <span>Product Management page >> Information Check page</span>
        </div>
        <div class="productView">
            <p><strong>ProductCode:</strong><span>${product.proCode }</span></p>
            <p><strong>ProductName:</strong><span>${product.proName }</span></p>
            <p><strong>Developer:</strong><span>${product.proDeveloper }</span></p>
            <p><strong>Publisher:</strong><span>${product.proPublisher }</span></p>
            <p><strong>Issue Date:</strong><span>${product.proDate }</span></p>
            <p><strong>Price:</strong><span>${product.proPrice }</span></p>
            <p><strong>Description:</strong><span>${product.proDesc}</span></p>
            <p><strong>Category:</strong>
                <c:if test="${product.proCate == 1}"><span>Casual</span></c:if>
                <c:if test="${product.proCate == 2}"><span>Cooperation</span></c:if>
                <c:if test="${product.proCate == 3}"><span>RPG</span></c:if>
                <c:if test="${product.proCate == 4}"><span>Strategy</span></c:if>
            </p>
            <p><strong>Video:</strong><span>${product.proVideo}</span></p>
            <p><strong>Image:</strong>
                <img src="../images/product/${product.proFilename }" height="150">
            </p>
			<div class="productAddBtn">
            	<input type="button" id="back" name="back" value="Back" >
            </div>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/productview.js"></script>

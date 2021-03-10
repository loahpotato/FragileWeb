<jsp:useBean id="product" scope="request" type="cn.fragile.pojo.Product"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>You are at:</strong>
            <span>Product Management page >> Product Addition page</span>
        </div>
        <div class="productAdd">
           <form id="pictureForm" name="pictureForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/image.do" >
			<input type="hidden" id="method" name="method" value="modifysave">
            <input type="hidden" name="pid" value="${product.id }"/>
            <input type="hidden" name="proCode" id="proCode" value="${product.proCode }" >
            <input type="hidden" name="proName" id="proName" value="${product.proName }">
            <input type="hidden" name="proDeveloper" id="proDeveloper" value="${product.proDeveloper }">
            <input type="hidden" name="proPublisher" id="proPublisher" value="${product.proPublisher }">
            <input type="hidden" name="proPrice" id="proPrice" value="${product.proPrice }">
            <input type="hidden" Class="Wdate" id="proDate" name="proDate"value="${product.proDate }"
                      readonly="readonly" onclick="WdatePicker();">
            <input type="hidden" id="proCate" name="proCate"value="${product.proCate }">
            <input type="hidden" id="fileName" name="fileName"value="${product.proFilename }">
            <input type="hidden" id="videoName" name="videoName" value="${product.proVideo }">

               <div>
                   <p><strong>Product Id:</strong><span>${product.id }</span></p>
                   <label for="proFilename">Image:</label>
                   <input type="file" name="proFilename" id="proFilename" value="">

               </div>

               <div>
                   <label for="proVideo">Video file:</label>
                   <input type="file" name="proVideo" id="proVideo" value="">

               </div>

               <div>
                   <label for="videoLink">Video link (recommend):</label>
                   <input type="text" name="videoLink" id="videoLink" value="">

               </div>

                <div class="productAddBtn" >
                    <input type="submit" name="add" id="add" value="Save" >
					<input type="button" id="back" name="back" value="Back" >
                </div>
            </form>


     </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pictureadd.js"></script>

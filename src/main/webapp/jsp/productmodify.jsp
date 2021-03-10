<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

  <div class="right">
      <div class="location">
          <strong>You are at:</strong>
          <span>Product Management page >> Product Modification page</span>
      </div>
      <div class="productAdd">
          <form id="productForm" name="productForm" method="post" action="${pageContext.request.contextPath }/jsp/product.do">
              <input type="hidden" name="method" value="modifysave">
              <input type="hidden" name="pid" value="${product.id }"/>
              <input type="hidden" name="proFilename" value="${product.proFilename }"/>
              <div class="">
                  <label for="proCode">Product Code:</label>
                  <input type="text" name="proCode" id="proCode" value="${product.proCode }" readonly="readonly">
              </div>
              <div>
                  <label for="proName">Product Name:</label>
                 <input type="text" name="proName" id="proName" value="${product.proName }">

              </div>
              
              <div>
                  <label for="proDeveloper">Developer:</label>
                  <input type="text" name="proDeveloper" id="proDeveloper" value="${product.proDeveloper }">

              </div>
              
              <div>
                  <label for="proPublisher">Publisher:</label>
                  <input type="text" name="proPublisher" id="proPublisher" value="${product.proPublisher }">
              </div>
              <div>
                  <label for="proPrice">Price:</label>
                  <input type="text" name="proPrice" id="proPrice" value="${product.proPrice }">

              </div>
              <div>
                  <label for="proDate">Issue Date:</label>
                  <input type="date" Class="Wdate" id="proDate" name="proDate"value="${product.proDate }"
                         readonly="readonly" onclick="WdatePicker();">
              </div>
              <div>
                  <label for="proCate">Category:</label>
                  <select name="proCate" id="proCate">
                      <option value="1" selected="selected">Casual</option>
                      <option value="2">Cooperation</option>
                      <option value="3">RPG</option>
                      <option value="4">Strategy</option>
                  </select>
              </div>
              
              <div>
                  <label for="proDesc">Description:</label>
                  <input type="text" name="proDesc" id="proDesc" value="${product.proDesc }">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/productmodify.js"></script>
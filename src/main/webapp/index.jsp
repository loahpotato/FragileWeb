<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fragile</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
</head>

<body>
    <%@include file="/HeadFoot/header.jsp"%>
    <div id="nav" class="content">
        <a href="${pageContext.request.contextPath }/search.do" class="loggo font">
            <span class="font log1"></span>
            <span class="font log2"></span>
        </a>

        <form class="right" method="get" action="${pageContext.request.contextPath }/search.do">
            <input name="method" value="querygame" type="hidden">
            <input type="submit" value="" class="right" id="searchbutton">
            <input type="search" name="queryProName" value="${queryProName }"placeholder="Dota2" class="right">
        </form>
        <a href="${pageContext.request.contextPath }/jsp/cart.do?method=querycart" class="ShoppingCart font right"> ShoppintCart</a>
    </div>
    <div id="banner" class="content">
        <h2 class="recommend">HighLights and Recommendations</h2>
        <div class="Avert">
            <a href="${pageContext.request.contextPath }/search.do?method=game&proid=2" class="pic"><img src="img/b2.jpg"></a>
            <a href="#" class="arrow Left font"></a>
            <div class="scroll">
            <a href="#" class="point"></a>
            <a href="#" class="point"></a>
            <a href="#" class="point"></a>
            </div>
            <a href="#" class="arrow Right font"></a>

        </div>
        <div class="intro">
            <div class="name">The Witcher3: Wild Hunt</div>
            <div class="name"> </div>
            <img src="img/b1.jpg">
            <img src="img/b3.jpg">
            <div class="status">Has been launched</div>
            <div class="label">Special praise</div>
            <div class="cost">
                <span class="discount">-50%</span>
                <span class="origin">¥76</span>
                <span class="now">¥38</span>
            </div>
        </div>
    </div>
    <div id="classification" class="content">
        <h2 class="title">Classification —————————————————————————————————</h2>
        <div class="holder">
            <a href="#Casual" class="type">
                <img src="img/casual.jpg" alt="" style="width: 100%; height: 100%;">
                <div>Casual</div>
            </a>
            <a href="#Cooperation" class="type">
                <img src="img/coop.jpg" alt="" style="width: 100%; height: 100%;">
                <div>Cooperation</div>
            </a>
            <a href="#Role" class="type">
                <img src="img/rpg.jpg" alt="" style="width: 100%; height: 100%;">
                <div>RPG</div>
            </a>
            <a href="#Strategy" class="type right">
                <img src="img/strategy.jpg" alt="" style="width: 100%; height: 100%;">
                <div>Strategy</div>
            </a>
        </div>
    </div>
    <div id="Type" class="content">
        <h2 id="Casual">Casual ————————————————————————————————————</h2>
        <div class="holder">
            <div class="lead">
                <span>Casual</span>
            </div>

            <c:forEach var="product" items="${productAntiList }" varStatus="status" >
            <c:if test="${product.proCate eq 1}">
            <div class="game right">
                <a href="${pageContext.request.contextPath }/search.do?method=game&proid=${product.id }" class="pic">
                    <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}"></a>
                <div class="mid"><span>
                            <c:if test="${fn: length(product.proName) > 18}">
                                ${fn:substring(product.proName, 0, 18)}...
                            </c:if>
                            <c:if test="${fn: length(product.proName) <= 18}">
                                ${product.proName}
                            </c:if>
                            </span><a href="" class="price">¥${product.proPrice}</a>
                </div>
                <div class="label"><span>New!!!</span></div>
                <div class="label"><span>Funny</span></div>
            </div></c:if>
            </c:forEach>

        </div>
        <div class="more">
            <a href="${pageContext.request.contextPath }/search.do?method=casual"   >more...</a>
        </div>
    </div>
    <div id="Type" class="content">
        <h2 id="Cooperation">Cooperation —————————————————————————————————</h2>
        <div class="holder">
            <div class="lead">
                <span>Cooperation</span>
            </div>

            <c:forEach var="product" items="${productAntiList }" varStatus="status" >
                <c:if test="${product.proCate eq 2}">
                    <div class="game right">
                        <a href="${pageContext.request.contextPath }/search.do?method=game&proid=${product.id }" class="pic">
                            <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}"></a>
                        <div class="mid"><span>
                            <c:if test="${fn: length(product.proName) > 18}">
                                ${fn:substring(product.proName, 0, 18)}...
                            </c:if>
                            <c:if test="${fn: length(product.proName) <= 18}">
                                ${product.proName}
                            </c:if>
                            </span><a href="" class="price">¥${product.proPrice}</a>
                        </div>
                        <div class="label"><span>New!!!</span></div>
                        <div class="label"><span>Funny</span></div>
                    </div></c:if>
            </c:forEach>
        </div>
        <div class="more">
            <a href="${pageContext.request.contextPath }/search.do?method=cooperation">more...</a>
        </div>
    </div>
    <div id="Type" class="content">
        <h2 id="Role">Role Play ———————————————————————————————————</h2>
        <div class="holder">
            <div class="lead">
                <span>RPG</span>
            </div>
            <c:forEach var="product" items="${productAntiList }" varStatus="status" >
                <c:if test="${product.proCate eq 3}">
                    <div class="game right">
                        <a href="${pageContext.request.contextPath }/search.do?method=game&proid=${product.id }" class="pic">
                            <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}"></a>
                        <div class="mid"><span>
                            <c:if test="${fn: length(product.proName) > 18}">
                                ${fn:substring(product.proName, 0, 18)}...
                            </c:if>
                            <c:if test="${fn: length(product.proName) <= 18}">
                                ${product.proName}
                            </c:if>
                            </span><a href="" class="price">¥${product.proPrice}</a>
                        </div>
                        <div class="label"><span>New!!!</span></div>
                        <div class="label"><span>Funny</span></div>
                    </div></c:if>
            </c:forEach>
        </div>
        <div class="more">
            <a href="${pageContext.request.contextPath }/search.do?method=rpg">more...</a>
        </div>
    </div>
    <div id="Type" class="content">
        <h2 id="Strategy">Strategy ———————————————————————————————————</h2>
        <div class="holder">
            <div class="lead">
                <span>Strategy</span>
            </div>
            <c:forEach var="product" items="${productAntiList }" varStatus="status" >
                <c:if test="${product.proCate eq 4}">
                    <div class="game right">
                        <a href="${pageContext.request.contextPath }/search.do?method=game&proid=${product.id }" class="pic">
                            <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}"></a>
                        <div class="mid"><span>
                            <c:if test="${fn: length(product.proName) > 18}">
                                ${fn:substring(product.proName, 0, 18)}...
                            </c:if>
                            <c:if test="${fn: length(product.proName) <= 18}">
                                ${product.proName}
                            </c:if>
                            </span><a href="" class="price">¥${product.proPrice}</a>
                        </div>
                        <div class="label"><span>New!!!</span></div>
                        <div class="label"><span>Funny</span></div>
                    </div></c:if>
            </c:forEach>
        </div>
        <div class="more">
            <a href="${pageContext.request.contextPath }/search.do?method=strategy">more...</a>
        </div>
    </div>
    <div id="tans" class="content">
        <img src="img/adv.jpg" alt="">
        <span>Enjoy Your Game</span>
    </div>
    <div id="discount" class="content">
        <h2>Special Offer</h2>
        <div class="holder">
            <div class="big example">
                <a href="${pageContext.request.contextPath }/search.do?method=game&proid=55">
                    <img src="img/biped.jpg">
                </a>
                <div class="label">Crazy Wednesday</div>
                <div class="ddl">Discount DeadLine: 10th.Jan</div>
                <div class="price">
                    <div class="sale">-36%</div>
                    <div class="p">
                        <div class="origin"><span>¥58</span></div>
                        <div class="now">¥37</div>
                    </div>
                </div>
            </div>
            <div class="big example">
                <a href="${pageContext.request.contextPath }/search.do?method=game&proid=56">
                    <img src="img/Escapists.jpg">
                </a>
                <div class="label">Crazy Tuesday</div>
                <div class="ddl">Discount DeadLine: 14th.Jan</div>
                <div class="price">
                    <div class="sale">-76%</div>
                    <div class="p">
                        <div class="origin"><span>¥78</span></div>
                        <div class="now">¥19</div>
                    </div>
                </div>
            </div>
            <div class="small top example">
                <a href="${pageContext.request.contextPath }/search.do?method=game&proid=54">
                    <img src="img/assassin.png">
                </a>
                <div class="price">
                    <div class="sale">-80%</div>
                    <div class="p">
                        <div class="now">¥120</div>
                        <div class="origin"><span>¥598</span></div>
                    </div>
                </div>
            </div>
            <div class="small example">
                <a href="${pageContext.request.contextPath }/search.do?method=game&proid=47">
                    <img src="img/Monster hunter.jpg">
                </a>
                <div class="price">
                    <div class="sale">-34%</div>
                    <div class="p">
                        <div class="now">¥134</div>
                        <div class="origin"><span>¥203</span></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="more">
            <a href="${pageContext.request.contextPath }/search.do?method=querygame">more...</a>
        </div>
    </div>
<%@include file="/HeadFoot/footer.jsp"%>
</body>

</html>
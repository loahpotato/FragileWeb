<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>game info</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/game.css">
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
    <div id="info" class="content">
        <div class="name">${product.proName }</div>
        <div class="holder">
            <c:if test="${not empty product.proVideo}">
                <c:if test="${fn:length(product.proVideo) > 35}">
                    <div class="video">
                        <video src="${product.proVideo}"autoplay="autoplay" muted="muted" controls="controls"></video>
                    </div>
                </c:if>
                <c:if test="${fn:length(product.proVideo) <= 35}">
                    <div class="video">
                        <video src="${pageContext.request.contextPath }/vedio/${product.proVideo}"autoplay="autoplay" muted="muted" controls="controls"></video>
                    </div>
                </c:if>
            </c:if>

            <c:if test="${empty product.proVideo}">
                <div class="video">
                    <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}" width="700">
                </div>
            </c:if>

            <div class="intro">
                <form id="productForm" name="productForm" method="post" action="${pageContext.request.contextPath }/jsp/cart.do?method=addcart">
                <input type="hidden" name="pId" value="${product.id}"/>
                <input type="hidden" name="pImage" value="${product.proFilename}"/>
                <input type="hidden" name="pPrice" value="${product.proPrice}"/>
                <input type="hidden" name="pName" value="${product.proName}"/>


                <img src="${pageContext.request.contextPath }/images/product/${product.proFilename}" alt="">
                <div class="gameinfo">${product.proDesc}</div>
                <div class="review">
                    <span style="color:#556772;">ALL REVIEWS:</span> <span
                        style="color:#54a5d4;">&nbsp;&nbsp;&nbsp;&nbsp;Very Positive</span> <span
                        style="color:#556772;">(292856)</span>
                </div>
                <div class="review">
                     <span style="color:#556772;">Developer:</span> <span
                        style="color:#54a5d4;">&nbsp;&nbsp;&nbsp;&nbsp;${product.proDeveloper}</span>
                </div>
                <div class="price">Price: &nbsp;¥${product.proPrice}</div>
                <div class="buy">
                    <input  type="submit" value="Add to Cart"></a>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div id="comment" class="content">
        <h3>Comment Form Customers</h3>
        <div class="helpfulre"> <span style="color: #ffffff;"> MOST HELPFUL REVIEW</span> <span
                style="color: #56707f;">(In the last past 30 days)</span></div>
        <div class="recent">RECENTLY POSTED</div>
        <div class="left">
            <div class="player">
                <img src="img/user_img.jpeg" alt=""> &nbsp;Serendipity
            </div>
            <div class="article">
                <div class="attitude">
                    <img src="img/up.png" alt="" style="width: 40px; height: 40px; vertical-align: middle;">
                    &nbsp;&nbsp;Recommended
                </div>
                <div class="date">POSTED: 24 DECEMBER, 2020</div>
                <div class="concrete">Honest Review, (From the mind of a simple critic) Industrial Gamers!

                    Gameplay. Sea of Thieves is about as free-form of an experience as you can get, which is both a
                    blessing and a curse. On the one hand, you could probably spend close to a dozen hours having fun
                    sailing around without ever realizing there is a proper campaign to follow (like I did). And that's
                    when I discovered that even though its free-roaming gameplay is enjoyable enough, once I realized
                    what these missions, called Tall Tales, were and how to access them they led to some of my favorite
                    moments.

                    Graphics. Can be either Beautiful or Deadly under the circumstances. A balanced mixture of
                    ever-changing waves and heavenly sunsets or cruel storms and destructive volcanoes. A game that
                    truly immerses the player in a vibrant world.

                    Controls. Easy to pick up. But don't be like me and pick out your banana instead of your pistol in a
                    fight...

                    Sound. Rough Seas 24/7 and the occasional boat crunch when you drop your anchor too close to the
                    shore. Love it!

                    Difficulty. The game offers very little in difficulty when you play with a crew, the difficulty
                    rises significantly when you try to solo a sloop. Solo means heightened awareness of all
                    surroundings, sea and land. Solo means if you gather enough treasure you welcome unwanted eyes from
                    npc's and players alike. And lastly, solo means if you are chased by preying eyes and damaged you
                    will have to act as both repairman and captain of the guns, which is in my opinion no easy feat.

                    Final Rating - Even though the game offers purely cosmetic items for everything you unlock. I still
                    enjoyed having fun with friends and being shocked by the unpredictable settings that the game sets
                    you in. I for one will always recommend this game because it is downright fun to play.</div>
            </div>
        </div>
        <div class="right">
            <div class="attitude">
                <img src="img/up.png" alt="" style="width: 25px; height: 25px; vertical-align: middle;"> &nbsp; Sheep
            </div>
            <div class="date">POSTED: 24 DECEMBER, 2020</div>
            <div class="concrete">
                Great to play with friends. Its got some really funny and cool and well-thought-out features. I know by
                this point there aren't that many players on the servers as there may have been at one point, but I
                actually think its the perfect amount. We don't always want to be encountering other players because
                there are also NPC ships and quests to do in the meantime. When I say there is well-thought-out features
                I mean like small things like how you can turn maps around to show other players (this one was really
                funny to me and my friends for whatever reason) and how you play your instruments out of tune if youre
                off the grog. Worth it for sure!
            </div>
        </div>
        <div class="right">
            <div class="attitude">
                <img src="img/down.png" alt="" style="width: 25px; height: 25px; vertical-align: middle;"> &nbsp; zongzi
            </div>
            <div class="date">POSTED: 22 DECEMBER, 2020</div>
            <div class="concrete">
                i hate this game!
            </div>
        </div>
        <div class="right">
            <div class="attitude">
                <img src="img/up.png" alt="" style="width: 25px; height: 25px; vertical-align: middle;"> &nbsp; zlf
            </div>
            <div class="date">POSTED: 21 DECEMBER, 2020</div>
            <div class="concrete">
                Great game with friends, hard to play solo
            </div>
        </div>
        <div class="left">
            <div class="player">
                <img src="img/user2.jpg" alt=""> &nbsp;Vossk
            </div>
            <div class="article">
                <div class="attitude">
                    <img src="img/down.png" alt="" style="width: 40px; height: 40px; vertical-align: middle;">
                    &nbsp;&nbsp; Not Recommended
                </div>
                <div class="date">POSTED: 20 DECEMBER, 2020</div>
                <div class="concrete">
                    I love this game dearly HOWEVER there are some key issues that need to be ironed out, and I am torn
                    on whether I would recommend. Your first 10-20 hours, like me, are going to be a dream. You'll grab
                    some friends and start sailin' the seven seas and living your best pirate life. But, like me,
                    eventually you are going to start noticing a vile, vile trend. The most experienced players in the
                    game (which as the game gets older turn into a larger and large portion of the player base) all
                    follow the same basic deeply frustrating tenets when it comes to naval battles. That is to say they
                    don't. Instead, experienced players use a storied exploit to board your ship and spawn camp you
                    until you either die or scuttle. In allowing for this play style to persist, RARE is preventing the
                    central promise of the game to be fulfilled. We will never have the pitched epic sea battles of our
                    dreams.
                </div>
            </div>
        </div>
        <div class="right">
            <div class="attitude">
                <img src="img/up.png" alt="" style="width: 25px; height: 25px; vertical-align: middle;"> &nbsp; lsy
            </div>
            <div class="date">POSTED: 21 DECEMBER, 2020</div>
            <div class="concrete">
                Great game with friends, hard to play solo
            </div>
        </div>
        <div class="right">
            <div class="attitude">
                <img src="img/up.png" alt="" style="width: 25px; height: 25px; vertical-align: middle;"> &nbsp; llh
            </div>
            <div class="date">POSTED: 21 DECEMBER, 2020</div>
            <div class="concrete">
                Great game with friends, hard to play solo
            </div>
        </div>
    </div>
<%@include file="/HeadFoot/footer.jsp"%>
</body>

</html>
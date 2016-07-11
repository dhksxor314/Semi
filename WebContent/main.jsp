<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인</title>
<link rel="stylesheet" href="/KnowHowFactory/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/KnowHowFactory/bootstrap/css/bootstrap-responsive.min.css">
<link rel=”stylesheet”
	href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
<script src="/KnowHowFactory/bootstrap/js/holder.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- icon -->
<style>
.thumbnail {
	border-radius: 0;
	position: relative;
	z-index: 1;
	border: 2px solid #fff;
	outline: 1px solid #ccc
}

.thumbnail:hover {
	border: 2px solid red;
	outline: 0;
}

.thumbnail a:hover {
	text-decoration: none
}

.thumbnail:hover img {
	position: relative;
	top: -4px;
}

.red {
	color: #FF0000
}

.ppp {
	color: #fff;
	background-color: #0000A0;
	font-size: 12px
}

.ddd {
	color: #fff;
	background-color: #FF0000;
	font-size: 12px
}
}
</style><style>
.img-wrapper {
    display: inline-block;
    
    
    overflow: hidden;
}

.img-wrapper img {
    -webkit-transition: all .5s ease;
    -moz-transition: all .5s ease;
    -ms-transition: all .5s ease;
    -o-transition: all .5s ease;
    transition: all .5s ease;
    vertical-align: middle;
}

.img-wrapper img:hover {
    transform:scale(1.5);
    -ms-transform:scale(1.5); /* IE 9 */
    -moz-transform:scale(1.5); /* Firefox */
    -webkit-transform:scale(1.5); /* Safari and Chrome */
    -o-transform:scale(1.5); /* Opera */
}
</style>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	
	<br />
	<br />
	<div id="theCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#theCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#theCarousel" data-slide-to="1"></li>
			<li data-target="#theCarousel" data-slide-to="2"></li>
			<li data-target="#theCarousel" data-slide-to="3"></li>
			<li data-target="#theCarousel" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner" style="background-size: 1920px 300px;">
			<div class="item active">
				<img src="/KnowHowFactory/images/coffee.jpg" alt="First slide"><img data-src="holder.js/300x200" alt="">
			</div>
			<div class="item">
				<img src="/KnowHowFactory/images/instrument.jpg" alt="Second slide">
			</div>
			<div class="item">
				<img src="/KnowHowFactory/images/book.jpg" alt="Second slide">
			</div>
			<div class="item">
				<img src="/KnowHowFactory/images/camera.jpg" alt="Third slide">
			</div>
		</div>
		<a href="#theCarousel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
		<a href="#theCarousel" class="carousel-control right"
			data-slide="next">&rsaquo;</a>
	</div>
	<br />
	<br />
	<div class="section">
		<div class="row">
			<div class="row">
			
				 <div class="span1 offset3">
					<ul class="nav nav-stacked" data-spy="affix">


						<li><a href="#section3"><i class="fa fa-3x fa-fw fa-bell"></i></a></li>
						<li><a href="#section3"><i
								class="fa fa-3x fa-fw -o fa-search"></i></a></li>
						<li><a href="#"><i
								class="fa fa-3x fa-fw fa-angle-double-up"></i></a></li>


					</ul>
				</div>
				<div class="span12">
					<h1>Conference</h1>
					<div class="red">즐거운 배움, 우리가 만드는 모임</div>
				</div>

			</div>
			
			 <div class="span3 offset4">
				<div class="thumbnail">
					<a href="#"><div class="img-wrapper"><img src="/KnowHowFactory/images/camera.jpg" alt=""  class="img-responsive"></div>
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">풍경 출사</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월1일 15시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/instrument.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">작가에 알려주는 글쓰기</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/art.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">감각적인 그리기</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;김세준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/album.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">추억을 떠올리게 하는 노래 듣기</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span1">
				<ul class="nav nav-stacked">
					<li class="active"><a href="#section1"><i
							class="fa fa-3x fa-fw fa-star-o"></i></a></li>

					<li><a href="#section3"><i class="fa fa-3x fa-fw fa-bell"></i></a></li>
					<li><a href="#section3"><i
							class="fa fa-3x fa-fw -o fa-search"></i></a></li>
					<li><a href="#section3"><i class="fa fa-3x fa-fw fa-bell"></i></a></li>


				</ul>
			</div>
		</div>
	</div>
	<div align="center">
		<button type="button" class=" btn btn-link">
			<h5>더 많은 강연 보기</h5>
		</button>
	</div>
	<div class="section">
		<div class="row">
			<div class="row">
				<div class="span4"></div>
				<div class="span4">
					<h1>Assembly</h1>
					<div class="red">즐거운 배움, 우리가 만드는 모임</div>
				</div>
			</div>
			<div class="span4"></div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/speech2.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">삶에 대한 고찰</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/flower.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">떠난 봄을 잡을 수 있는 꽃꽃이</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/Writing.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">작가에 알려주는 글쓰기</td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>
			<div class="span3">
				<div class="thumbnail">
					<a href="#"><img src="/KnowHowFactory/images/coffee.jpg" alt="">
						<div class="caption">
							<table>

								<tbody>
									<tr>
										<td>
											<button class="btn btn-danger" type="button">&nbsp;&nbsp;&nbsp;&nbsp;♥&nbsp;&nbsp;&nbsp;&nbsp;</button>
											<button class="btn btn-info" type="button">진행증</button>

										</td>
									</tr>
									<tr>
										<div class="progress">
											<div class="progress-bar ddd" role="progressbar"
												style="width: 60%;">60% Complete</div>
										</div>
									</tr>
									<tr>
										<td class="red">핸드드립 1:1 클래스 </td>
									</tr>
									<tr>
										<td><br /></td>

									</tr>
									<tr>
										<td><i class="icon-time"></i>&nbsp;7월10일 2시</td>

									</tr>
									<tr>

										<td align="left"><i class="icon-flag"></i>&nbsp;서울 서대문구</td>
									</tr>
									<tr>

										<td><i class="icon-user"></i>&nbsp;박용준</td>
									</tr>

								</tbody>
							</table>

						</div> </a>
				</div>
			</div>

		</div>
	</div>
	<div align="center">
		<button type="button" class=" btn btn-link">
			<h5>더 많은 강연 보기</h5>
		</button>
	</div>
	<%@ include file="include/footer.jsp" %>
	<script src="/KnowHowFactory/bootstrap/js/jquery-2.2.3.min.js"></script>
	<script src="/KnowHowFactory/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
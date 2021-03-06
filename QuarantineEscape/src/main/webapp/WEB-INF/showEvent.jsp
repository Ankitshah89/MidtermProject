<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.quarantineescape.entities.Role"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/showevent.css">
<%-- <jsp:include page="js/try.js"></jsp:include> --%>
<meta charset="UTF-8">
<title>Quarantine Escape - Event Profile</title>
</head>
<body>

	<div class="store-page-container">
		<section class="store-header">
			<h1 class="store-header-title" align="center">${event.title }</h1>
			<hr class="hidden-xs break-lines">


			<div class="profile-userbuttons1">
				<form action="userLandingPage.do" method="POST">
					<input type="submit" value="Home" class="btn btn-success btn-sm" />
				</form>
			</div>


			<section class="store-body">

				<img class="store-content" src="${event.eventImageUrl }"
					alt="Event Image" />

				<div class="store-info">
					<div class="store-info-container">
						<address class="store-address">
							<span>${event.location} </span> <span></span> <span
								class="text-highlight-xs">(847) 272-8920</span> <a
								href="https://www.google.com/maps/place/1775+${event.location }"
								class="text-highlight-xs text-highlight-md map" target="_blank">

								<hr class="break-lines" /> Map and Directions
							</a>
						</address>
						<div>
							<p>
								<b>Event Date</b><br>${event.eventDate }</p>
							<p>
								<b>Event Time</b><br>${event.eventTime }</p>
						</div>
						<ul class="store-hours">

							<li><b>Public:</b> ${event.publicOrPrivate }</li>
							<li><b>Status:</b> ${event.status }</li>
						</ul>


						<hr class="break-lines" />




						<div class="store-other-info">
							<div class="store-features">
								<div class="store-feature-title">
									<b>${event.title }</b>
								</div>
								<a class="store-appointment" target="_blank"
									href="${event.eventLink}">Visit the Website</a>
							</div>

							<div>

								<c:if test="${not empty loggedInUser}">
									<form action="attendEvent.do" method="POST" class="form-group">
										<input type="hidden" value="${event.id}" name="eventId" /> <input
											type="hidden" value="${user.id}" name="userId" /> <input
											type="submit" value="RSVP" class="btn btn-primary" />
									</form>
								</c:if>
							</div>

							<div class="store-features hidden-xs">
								<div class="store-feature-title  text-inline">
									<b>Pre-Requisite:</b>
								</div>
								<p class="text-inline">${event.prereqs }</p>
							</div>
						</div>
					</div>
				</div>
				<hr class="break-lines" />
				<hr class="break-lines" />
				<hr class="break-lines" />
				<div class="store-features">
					<div class="store-feature-title">
						<strong>Event Details</strong>
					</div>
					<p class="store-detail">${event.description }</p>
					<hr class="break-lines" />
					<hr class="break-lines" />





					<c:if test="${not empty sessionScope.loggedInUser }">
						<br>
						<br>
						<br>
						<h4 align="center">Comments Below:</h4>
						<form role="form" action="createEventComment.do" method="POST">
							<div class="form-group">
								<textarea class="form-control" rows="3" name="comment" required></textarea>
							</div>

							<input type="hidden" value="${event.id}" name="eventId">
							<button type="submit" class="btn btn-success">Submit</button>
						</form>
						<br>
						<br>

						<p>
							<span class="badge">${commentList.size()}</span> Posts:
						</p>
						<br>

						<div class="row">

							<c:forEach var="comment" items="${commentList}">
								<div class="col-sm-2 text-center">
									<img src="${comment.user.userImageUrl}" class="img-circle"
										height="65" width="65" alt="Avatar">
								</div>
								<div class="col-sm-10">
									<h4>
										<a href="findUser.do?id=${comment.user.id}">${comment.user.username}</a>
										<small>${comment.createdAt}</small>
									</h4>
									<p>${comment.content}</p>
									<br>
								</div>
							</c:forEach>
						</div>
					</c:if>






				</div>



			</section>



			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
				integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
				crossorigin="anonymous"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
				integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
				crossorigin="anonymous"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
				integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
				crossorigin="anonymous"></script>
</body>
</html>
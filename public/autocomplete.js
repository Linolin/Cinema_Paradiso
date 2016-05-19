
					var baseurl;
    				var request = new XMLHttpRequest();
					request.open('GET', 'http://api.themoviedb.org/3/configuration?api_key=663428f9bca787c67552f9c76c0362b9');
					request.setRequestHeader('Accept', 'application/json');
					request.onreadystatechange = function () {
  						if (this.readyState === 4) {
   							var response = this.responseText;
   							var obj = JSON.parse(response);
   							baseurl = obj.images.base_url;
  						}
					};
					request.send();

					var suggestAutocompletion = true;

					$('form').on('keyup change', 'input#movie_title', function(){
						if (suggestAutocompletion) {
							var inputTitle = $('input#movie_title').val();
    						if (inputTitle.length >= 3) {
    							findMovie(inputTitle, "it");
    						} else {
    							resetFormPreview();
    							$(".autocomplete").addClass("hidden");
    						}
						}
					});

					var id, title, plot, duration, genere, director, actors, trailer_url, poster_url;

					function findMovie(t, language) {
						t = escape(t);
    					var request = new XMLHttpRequest();
						request.open('GET', 'http://api.themoviedb.org/3/search/movie?api_key=663428f9bca787c67552f9c76c0362b9&query=' + t + '&language=' + language);
						request.setRequestHeader('Accept', 'application/json');
						request.onreadystatechange = function () {
  							if (this.readyState === 4) {
   								var response = this.responseText;
   								var obj = JSON.parse(response);
   								obj = obj.results[0];  // Best result.
   								if (obj != null) {
   									$(".autocomplete").removeClass("hidden");
   								}
   								// Get title.
   								title = obj.title;
   								$("#found_title").text(title);
   								// Get id.
   								var newId = obj.id;
   								if (id != newId) {
   									// Update movie info.
   									getMovieInfo(newId, language);
   								}
  							}
						};
						request.send();
					}

					function getMovieInfo(id, language) {
						var request = new XMLHttpRequest();
						request.open('GET', 'http://api.themoviedb.org/3/movie/' + id + '?api_key=663428f9bca787c67552f9c76c0362b9&language=' + language);
						request.setRequestHeader('Accept', 'application/json');
						request.onreadystatechange = function () {
  							if (this.readyState === 4) {
   								var response = this.responseText;
   								var obj = JSON.parse(response);
   								// Get plot.
   								plot = obj.overview;
   								// Get duration.
   								duration = obj.runtime;
   								// Get genere.
   								var genres = obj.genres;
   								genere = "";
								for (var i = 0; i < genres.length; i++) {
   									if (genere == "") {
   										genere = genres[i].name;
   									} else {
   										genere = genere + ", " + genres[i].name;
   									}
   								}
   								// Get poster URL.
   								poster_url = null;
   								poster_url = obj.poster_path;
   								// Get actors and director (and trailer URL).
   								getMovieActorsAndDirector(id);
  							}
						};
						request.send();
					}

					function getMovieActorsAndDirector(id) {
						var request = new XMLHttpRequest();
						request.open('GET', 'http://api.themoviedb.org/3/movie/' + id + '/credits?api_key=663428f9bca787c67552f9c76c0362b9');
						request.setRequestHeader('Accept', 'application/json');
						request.onreadystatechange = function () {
							if (this.readyState === 4) {
   								var response = this.responseText;
   								var obj = JSON.parse(response);
   								// Get actors.
   								var cast = obj.cast;
   								actors = [];
   								var numberOfActorsToGet = 5
   								for (var i = 0; i < cast.length; i++) {
   									if (numberOfActorsToGet > 0) {
   										actors.push(cast[i].name);
   										numberOfActorsToGet--;
   									}
   								}
   								// Get director.
   								var crew = obj.crew;
   								for (var i = 0; i < crew.length; i++) {
   									if (crew[i].department == "Directing") {
   										director = crew[i].name;
   										numberOfActorsToGet--;
   									}
   								}
   								// Get trailer URL.
   								getMovieTrailerURL(id);
  							}
  							
						};
						request.send();
					}

					function getMovieTrailerURL(id) {
						var request = new XMLHttpRequest();
						request.open('GET', 'http://api.themoviedb.org/3/movie/' + id + '/videos?api_key=663428f9bca787c67552f9c76c0362b9');
						request.setRequestHeader('Accept', 'application/json');
						request.onreadystatechange = function () {
  							if (this.readyState === 4) {
   								var response = this.responseText;
   								var obj = JSON.parse(response);
   								// Get trailer url.
   								if (obj.results.length > 0) {
   									trailer_url = obj.results[0].key;
   								}
   								
   								// Update preview.
   								updateFormPreview();
  							}
						};
						request.send();
					}

					function updateFormPreview() {
						if (plot != null) {
							$('textarea#movie_plot').attr("placeholder", plot);
						}
						if (duration != null) {
							$('input#movie_duration').attr("placeholder", duration);
						}
						if (genere != null) {
							$('input#movie_genere').attr("placeholder", genere);
						}
						if (director != null) {
							$('input#movie_director').attr("placeholder", director);
						}
						if (poster_url != null) {
							$('input#movie_poster_url').attr("placeholder", baseurl + "/original/" + poster_url);
						}
						if (trailer_url != null) {
							$('input#movie_trailer_url').attr("placeholder", trailer_url);
						}
						// Attori
						//for (var i = 0; i < actors.length; i++) {
						//	document.getElementById("addActor").click();
						//}
					}

					function resetFormPreview() {
						if (plot != null) {
							$('textarea#movie_plot').attr("placeholder", "");
							$('input#movie_duration').attr("placeholder", "");
							$('input#movie_genere').attr("placeholder", "");
							$('input#movie_director').attr("placeholder", "");
							$('input#movie_poster_url').attr("placeholder", "");
							$('input#movie_trailer_url').attr("placeholder", "");
						}
						// Attori
					}

					function updateForm() {
						suggestAutocompletion = false;
						$(".autocomplete").addClass("hidden");
						if (title != null) {
							$('input#movie_title').val(title);
						}
						if (plot != null) {
							$('textarea#movie_plot').val(plot);
						}
						if (duration != null) {
							$('input#movie_duration').val(duration);
						}
						if (genere != null) {
							$('input#movie_genere').val(genere);
						}
						if (director != null) {
							$('input#movie_director').val(director);
						}
						if (poster_url != null) {
							$('input#movie_poster_url').val(baseurl + "/original/" + poster_url);
							updatePosterFromURL();
						}
						if (trailer_url != null) {
							$('input#movie_trailer_url').val(trailer_url);
						}
						// Attori
						suggestAutocompletion = true;
					}

					$('.autocomplete').click(function () {
        				updateForm();
    				});

    				$('input#movie_poster_url').change(function() {
     					updatePosterFromURL();
    				});

    				function updatePosterFromURL() {
    					$("img.poster").attr("src", $('input#movie_poster_url').val());
    				}
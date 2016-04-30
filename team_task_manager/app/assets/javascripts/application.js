// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  attachListeners();
});

  function attachListeners(){
    $('.hideInfo').hide();
    $('#hideComments').hide();
    $('#loadComments').on('click', function(){
      loadComments();
    });
    $('form').on('submit', function(event){
      createComment(event, this);
    });
    $('#hideComments').on('click', function(){
      hideComments();
    });
    $('.moreInfo').on('click', function(){
      getMoreInfo(this);
    }); 
    $('.hideInfo').on('click', function(){
      hideMoreInfo(this);
    });
    $('#viewUsers').on('click', function(){
      viewUsers();
    });
    $('#hideUsers').on('click', function(){
      hideUsers();
    });
  }


  function loadComments() {
    $('#projectComments').html('<h5>Comments:</h5>')
    $.ajax({
      method: 'GET',
      url: this.href,
      dataType: 'JSON'
    }).done(function(projectData){
      extractComments(projectData);
    })
  }

  function extractComments(projectData) {
    var project = projectData["project"];
    var comments = project["comments"];
      for (var i = 0; i < comments.length; i++) {
        var commentData = comments[i];
        var commentHtml = '';
        commentHtml = buildCommentParagraph(commentData);
        $('#projectComments').append(commentHtml);
      }
    $('#loadComments').hide();
    $('#hideComments').show();
  }

  function buildCommentParagraph(commentData){
    return "<p>" + commentData["user"]["name"] + " said " + commentData["content"] + "</p>";
  }

  function createComment(event, form) {
    event.preventDefault();
    var commentData = $(form).serialize();
    $.ajax({
      method: 'POST',
      url: '/comments',
      data: commentData
    }).done(function(data){
      appendComment(data);
    })
  }

  function appendComment(data) {
    var commentData = data.comment;
    $('#projectComments').append(buildCommentParagraph(commentData));
  }

  function hideComments() {
    $('#projectComments').html('');
    $('#loadComments').show();
    $('#hideComments').hide();
  }
  
  function getMoreInfo(link) {
    $.ajax({
      method: 'GET',
      url: '/projects/' + link.attributes[1].value,
      dataType: 'JSON'
    }).done(function(projectData){
      extractInfo(projectData);
    });
  }

  function extractInfo(projectData){
    var id = projectData["project"]["id"];
    var description = projectData["project"]["description"];
    $('p[data-id="'+ id +'"]').text(description);
    $('a.moreInfo[data-id="'+ id +'"]').hide();
    $('a.hideInfo[data-id="'+ id +'"]').show();
  }

  function hideMoreInfo(link) {
    var id = link.attributes[1].value;
    $(this).hide();
    $('p[data-id="'+ id +'"]').text('');
    $('a.moreInfo[data-id="'+ id +'"]').show();  
  } 

  function viewUsers() {
    $('#viewUsers').hide();
    $('#hideUsers').show();
    $.ajax({ 
      method: 'GET',
      url: '/users',
      dataType: 'JSON'
    }).done(function(usersData){
      extractUsers(usersData);
    });
  }
  
  function extractUsers(usersData) {
    var users = usersData["users"];
    for(var i = 0; i < users.length; i++){
      var user = {
        name: users[i]["name"],
        taskCount: users[i]["tasks"].length
      }
      appendUser(user);
    }
  }

  function appendUser(user) {
    var usersDiv = $('#users');
    usersDiv.append('<p>' + user.name + ' has ' + user.taskCount + ' tasks!</p>');
  }

  function hideUsers() {
    $('#users').html('');
    $('#viewUsers').show();
    $('#hideUsers').hide();
  }

$(document).ready(
  function(){
    $('.hideInfo').hide();
    $('#hideComments').hide();
    $('#loadComments').on('click', loadComments());
    $('form').on('submit', createComment(event));
    $('#hideComments').on('click', hideComments();
    $('.moreInfo').on('click', getMoreInfo(); 
    $('.hideInfo').on('click', hideMoreInfo());
    $('#viewUsers').on('click', viewUsers());
    $('#hideUsers').on('click', hideUsers())
  }
);

  function loadComments() {
    $('#projectComments').html('<h5>Comments:</h5>')
    $.ajax({
      method: 'GET',
      url: this.href,
      dataType: 'JSON'
    }).done(extractComments(projectData) {
      $('#loadComments').hide();
      $('#hideComments').show();
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
  }

  function buildCommentParagraph(commentData){
    return "<p>" + commentData["user"]["name"] + " said " + commentData["content"] + "</p>";
  }

  function createComment(event) {
    event.preventDefault();
    var commentData = $(this).serialize();
    var posting = $.post('/comments', commentData);
      posting.done(appendComment(data));
  }

  function appendComment(data) {
    debugger;
  }

  function hideComments() {
    $('#projectComments').html('');
    $('#loadComments').show();
    $(this).hide();
  }
  
  function getMoreInfo() {
    $.ajax({
      method: 'GET',
      url: '/projects/' + this.attributes[1].value,
      dataType: 'JSON'
    }).done(extractInfo(projectData));
  }

  function extractInfo(projectData){
    var id = projectData["project"]["id"];
    var description = projectData["project"]["description"];
    $('p[data-id="'+ id +'"]').text(description);
    $('a.moreInfo[data-id="'+ id +'"]').hide();
    $('a.hideInfo[data-id="'+ id +'"]').show();
  }

  function hideMoreInfo() {
    var id = this.attributes[1].value;
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
    }).done(extractUsers(usersData));
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

    



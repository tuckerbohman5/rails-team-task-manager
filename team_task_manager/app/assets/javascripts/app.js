$(document).ready(
  function(){
    $('#hideComments').hide();
    $('#loadComments').on('click', loadComments())
  }
);

  //Lodading Comments without page reload//
  // $('#loadComments').on('click', function(){
  
  //   loadComments();
  // });


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


  $('form').on('submit', function(event){
  
  event.preventDefault();
  var values = $(this).serialize();
 
  var posting = $.post('/comments', values);

  posting.done(function(data){
    $('#projectComments').append(data);
  })
  
  
})

  $('#hideComments').on('click', function(){
    $('#projectComments').html('');
    $('#loadComments').show();
    $(this).hide();
  })



  $(document).ready(
   function()
   {
     $('.hideInfo').hide();
   }
);

  $('.moreInfo').on('click', function() {
    // event.preventDefualt();
    
    $.ajax({
      method: 'GET',
      url: '/projects/' + this.attributes[1].value,
      dataType: 'JSON'
    }).done(function(response) {
      var id = response["project"]["id"];
      var description = response["project"]["description"];
      $('p[data-id="'+ id +'"]').text(description);
      $('a.moreInfo[data-id="'+ id +'"]').hide();
      $('a.hideInfo[data-id="'+ id +'"]').show();
    })
      })

  $('.hideInfo').on('click', function(){
    var id = this.attributes[1].value;
    $(this).hide();
    $('p[data-id="'+ id +'"]').text('');
    $('a.moreInfo[data-id="'+ id +'"]').show();
  })
//end more info

  $('#viewUsers').on('click', function() {
    $('#viewUsers').hide();
    $('#hideUsers').show();
    $.ajax({
      method: 'GET',
      url: '/users',
      dataType: 'JSON'
    }).done(function(response) {
      var usersDiv = $('#users');
      var users = response["users"];
      
      
      for (var i = 0; i < users.length; i++){
        
        var user = {
          name: users[i]["name"],
          taskCount: users[i]["tasks"].length
        }
          
        usersDiv.append('<p>' + user.name + ' has ' + user.taskCount + ' tasks!</p>');
      }
        
      })

    })
  $('#hideUsers').on('click', function(){
    $('#users').html('');
    $('#viewUsers').show();
    $('#hideUsers').hide();

  })

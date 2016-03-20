<% if !@project.comments.nil? %>
<h5>Comments:</h5>
  <% @project.comments.each do |comment| %>
  <p><%= comment.user.name %> Said: <%= comment.content %></p>
  <% end %>
<% end %>

Need to figure out why this doesn't work
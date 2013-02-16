<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title><%= title %></title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link type="text/css" href="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.css" rel="stylesheet">
    <script type="text/javascript" src="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.js"></script>
    <style>
body {
  padding: 0;
  margin: 1em 1em 0;
  font-family: sans-serif;
  line-height: 1.4em;
}

a:link {
  color: #000498;
}
a:visited {
  color: black;
}
a:hover {
  color: #4549ff;
}
a:active {
  color: black;
}

header {
  margin: 0 0 1em;
}

header a {
  text-decoration: none;
}

header h1 {
  margin: 1em 0;
}

section {
  padding: .5em 1em;
  margin: 1em;
  border-width: 3px;
  border-style: solid;
  border-color: #e2e3ec;
}

h1, h2, h3 {
  margin: 6px 0 .6em;
  font-family: serif;
}

h1 {
  font-size: 1.6em;
}

h2 {
  font-size: 1.4em;
  margin: .4em 0 .8em;
}

h3 {
  font-size: 1.2em;
}

p {
  margin: .5em 0;
}

ul {
  margin: 0;
}

.description {
  margin: .5em 0;
}

#content {
  margin: 0 auto;
  max-width: 800px;
}

nav {
  padding: .3em;
}

nav.compact {
  line-height: 2em;
  background-color: #e2e3ec;
}

nav ul {
  padding: 2px 7px;
  list-style-type: none;
}

nav.compact ul {
  background-color: transparent;
}

nav.compact ul li {
  font-weight: bold;
}

.inlineIndexItem {
  padding: .3em .2em;
  background-color: white;
}

footer {
  text-align: center;
  padding: .5em 0;
  color: #858585;
}

footer a:link, footer a:visited {
  color: #5b5c88;
}

code {
  background-color: #eee;
  display: block;
  font-family: monospace;
  white-space: pre;
  margin: .7em;
  padding: .3em .5em;
  color: #1f1f1f;
}

ul.properties {
  list-style-type: none;
  padding: 0 0 0 1em;
}

ul.properties li {
  margin: .3em 0;
}

.property {
  font-weight: bold;
  font-family: serif;
  font-size: 1.2em;
}

.depth0 {
  margin: 1em 0em;
  border-color: #B2B3BB;
  border-width: 4px;
}

.depth1 {
  margin: 1em 0 1em 1em;
  border-color: #CECFD7;
}

.depth2 {
  margin: 1em 0 1em 2em;
}

.depth3 {
  margin: 1em 0 1em 3em;
}

.depth0.header {
  display:none;
}
    </style>
    <% if (css) { %>
      <link rel="stylesheet" href="<%= css %>"></style>
    <% } %>
  </head>
  <body>
    <div id="content">
      <header>
        <h1>
          <a href="/">
            <%= title %>
          </a>
        </h2>
        <%= description %>
      </header>
      <nav class="<%= compact_index ? "compact" : ""%>">
        <ul>
          <% _.each(sections, function(s) { %>
            <% if (s.header || s._name) { %>
              <%= compact_index && s._depth === deepest_depth ? "" : "<li>"%>
                <% if (!compact_index || s._depth !== deepest_depth) { %>
                  <% for (var i = shallowest_depth; i < s._depth; i++) {print("- ");} %>
                <% } %>
                <% if (s.header) { %>
                  <a href="#header-<%= s.header.replace(/ /g, '-') %>" class="<% if (compact_index && s._depth === deepest_depth) print("inlineIndexItem") %>"><%= s.header %></a>
                <% } %>
                <% if (!s.header && s._name) { %>
                  <a href="#name-<%= s._name %>" class="<% if (compact_index && s._depth === deepest_depth) print("inlineIndexItem") %>"><%= s._name %></a>
                <% } %>
              <%= compact_index && s._depth === deepest_depth ? "" : "</li>"%>
            <% } %>
          <% }); %>
        </ul>
      </nav>
      <div id="sections">
        <% _.each(sections, function(s) { %>
        
          <section class="depth<%= s._depth %> <%= s.header !== "undefined" ? "header" : "" %>" data-module="<%= s._module %>">
          
            <%= s.header ? '<h1 id="header-' + s.header.replace(/ /g, '-') + '">' + s.header + "</h1>" : "" %>
            
            <% if (s._name) { %>
              <h2 id="name-<%= s._name %>">
                <%= ((s._type === "function" || s._type === "other") && !(s._name === 'Entity' || s._name === 'World' || s._name === 'boxbox') ? "." : "") %><%= s._name %><%= ((s._type === "other" || s._type === "function") && !(s._name === 'Entity' || s._name === 'World' || s._name === 'boxbox') ? "( " + (s._params ? s._params : "") + " )" : "") %>
              </h2>
            <% } %>
            
            <ul class="properties">
              <% _.each(s, function(val, prop) { %>
                <% if (prop !== "header" &&
                       prop !== "description" &&
                       prop !== "_depth" &&
                       prop !== "_module" &&
                       prop !== "_type" &&
                       prop !== "_name" &&
                       prop !== "_params") { %>
                  <li>
                  <%if (val === 'by topheman') { %>
                    <span class="added-by-topheman"><span class="property">added</span> by topheman</span>
                  <% } else { %>
                    <span class="property"><%= prop %></span>
                    <span><%= val %></span>
                  <% } %>
                  </li>
                <% } %>
              <% }); %>
            </ul>
            
            <%= s.description ? '<div class="description">' + s.description + "</div>" : "" %>
            
          </section>
        <% }); %>
      </div>
    </div>
    <footer>
      generated by <a href="http://incompl.github.com/updoc/">updoc</a> <%= version %>
    </footer>
    <script>
(function() {
  var codes = document.getElementsByTagName("code")
  for (var i = 0; i < codes.length; i++) {
    codes[i].className = codes[i].className + " prettyprint";
  }
  prettyPrint();
})();
  </script>
  </body>
</html>

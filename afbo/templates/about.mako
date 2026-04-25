<%inherit file="afbo.mako"/>
<%namespace name="util" file="util.mako"/>
<%! from clld_markdown_plugin import markdown %>
<%! active_menu_item = "about" %>

<%def name="sidebar()">
    <%util:well title="Contents">
    <ul class="nav nav-pills nav-stacked">
    % for num, title, _ in sections:
        <li><a href="#sec-${num}">${title}</a></li>
    % endfor
    </ul>
    </%util:well>
</%def>

<h3>About AfBo</h3>

% for num, title, text in sections:
<%util:section id="sec-${str(num)}" title="${title}" level="${4}">
    ${markdown(request, text)|n}
</%util:section>
% endfor

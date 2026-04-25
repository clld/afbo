<%inherit file="../afbo.mako"/>
<%namespace name="util" file="../util.mako"/>
<%! from clld_markdown_plugin import markdown %>
<%! active_menu_item = "pairs" %>

<h2>${ctx.name}</h2>

<h3>Summary</h3>
${request.get_datatable('values', h.models.Value, pair=ctx).render()}

<h3>Description</h3>
${markdown(request, ctx.description)|n}

<%def name="sidebar()">
    <%util:well>
        ${util.dl_table(('Recipient language', h.link(request, ctx.recipient)), ('Donor language', h.link(request, ctx.donor)), ('Reliability of borrowed status/affixhood', ctx.reliability), ('Borrowed affixes', ctx.count_borrowed), ('Interrelated affixes', ctx.count_interrel))}
    </%util:well>
    % if len(ctx.recipient.donor_assocs) > 1:
     <%util:well>
        Affixes borrowed from other languages in ${ctx.recipient}:
        ${util.stacked_links([pair for pair in ctx.recipient.donor_assocs if pair != ctx])}
    </%util:well>
   % endif
    <%util:well title="References">
        ${util.sources_list(sorted(list(ctx.sources), key=lambda s: s.name))}
    </%util:well>
</%def>

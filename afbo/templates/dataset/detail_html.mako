<%inherit file="../afbo.mako"/>
<%namespace name="util" file="../util.mako"/>

<%def name="sidebar()">
    ${util.cite()}
</%def>

<h2>Welcome to AfBo</h2>
<p class="lead">
    AfBo 2.0 comprises descriptions of ${count_pairs} cases of affix borrowing, i.e. cases where one
    language borrowed at least one affix from another language, involving a total of ${count_borrowed_affixes}
    borrowed affixes. It includes an online interface with descriptions of borrowed
    affixes in terms of their forms and functions, examples of combinations of borrowed
    affixes with native stems, search functions, maps, and ${count_sources} bibliographical
    references. The entire database underlying AfBo can be downloaded.
</p>

<p style="font-size: larger;">
    AfBo 1.0 was compiled by Frank Seifart between 2007 and 2013 with funding from the
    Max Planck Institute for Evolutionary Anthropology's Department of Linguistics,
    led by Bernard Comrie. Revisions and additions leading to AfBo 2.0 were compiled under the
    responsibility of Frank Seifart and Francesco Gardani. AfBo is published as part of the
    ${h.external_link('https://clld.org', label='Cross-Linguistic Linked Data')}
    initiative.
</p>

<p style="font-size: larger;">
    The content of this web site, including the
    <a href="${request.route_url('download')}">downloadable database</a>,
    is  published under a
    <a rel="license" href="${request.dataset.license}">
        ${request.dataset.jsondata.get('license_name', request.dataset.license)}
    </a>.
</p>

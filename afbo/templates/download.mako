<%inherit file="home_comp.mako"/>
<%namespace name="util" file="util.mako"/>

<h3>Downloads</h3>

<div class="alert alert-info">
    <p>
        AfBo Online serves the latest
        ${h.external_link('https://github.com/cldf-datasets/afbo/releases', label='released version')}
        of data curated at
        ${h.external_link('https://github.com/cldf-datasets/afbo', label='cldf-datasets/afbo')}.
        Older released version are accessible via <br/>
        <a href="https://doi.org/10.5281/zenodo.3610154"><img
                src="https://zenodo.org/badge/DOI/10.5281/zenodo.3610154.svg" alt="DOI"></a>
        <br/>
        on ZENODO as well.
    </p>
</div>

<%def name="sidebar()">
    ${util.cite(request.dataset)}
</%def>

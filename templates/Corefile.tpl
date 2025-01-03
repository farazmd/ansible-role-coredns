#jinja2:lstrip_blocks: True
{% if coredns_default_zone %}
{{ coredns_default_zone }} {
    {% for plugin in coredns_default_zone_plugins + coredns_common_plugins %}
    {% if plugin.config | default(false) %}
    {{ plugin.name }} {{ ' ' + (plugin.args | string) if plugin.args | default(false) else '' }} {
        {{ plugin.config | indent(8)}}
    }
    {% else %}
    {{ plugin.name }} {{ ' ' + (plugin.args | string) if plugin.args | default(false) else '' }}
    {% endif %}
    {% endfor %}
}
{% endif %}

{% for zone in coredns_zones %}
{{ zone.name }} {
    {% for plugin in (coredns_common_plugins + ( zone.plugin if zone.plugin | default(false) else [] ) ) %}
    {% if plugin.config | default(false) %}
    {{ plugin.name }} {{ ' ' + (plugin.args | string) if plugin.args | default(false) else '' }} {
        {{ plugin.config | indent(8)}}
    }
    {% else %}
    {{ plugin.name }} {{ ' ' + (plugin.args | string) if plugin.args | default(false) else '' }}
    {% endif %}
    {% endfor %}
}
{% endfor %}
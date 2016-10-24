{% if totalPages > 1 %}
    <div class="pagination">
        <div class="text-cout">Page {{ page ~ '/' ~ totalPages }} of {{ total_items }} result</div>
        <ul class="list-link list-unstyled">
            {{ paging }}
        </ul>
    </div>
{% endif %}
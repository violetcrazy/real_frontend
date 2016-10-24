{% if totalPages > 1 %}
    <div class="pagination">
        <div class="text-cout">Trang {{ page ~ '/' ~ totalPages }} của {{ total_items }} kết quả</div>
        <ul class="list-link list-unstyled">
            {{ paging }}
        </ul>
    </div>
{% endif %}
from rest_framework.pagination import PageNumberPagination


class CoursePagination(PageNumberPagination):
    """ 课程列表分页器 """
    page_query_param = "page"        # 页码数
    page_size_query_param = "size"   # 但也数据量
    page_size = 5                    # 默认的单页数据量
    max_page_size = 20               # 允许客户端设置的单页数据流量














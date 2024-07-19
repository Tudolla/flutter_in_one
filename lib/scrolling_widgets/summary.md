1.GridView : có tất cả tính năng, nhưng phải xác định 2 widget con là SliverFixCount() ..
2.GridView.count : kế thừa từ GridView nhưng đơn giản hơn, xác định được số cột crossAxisCount
3.GridView.extent: kế thừa từ GridView và dùng cho xác định kích thước với thuộc tính: maxCrossAxisExtent.
4.PageView : Hiển thị các trang slider mà không cần nút bấm để chuyển trang.

//---------------------------------------------------- 5. ListView: hiệu suất thấp vì các phần tử con trong Listview sẽ được build toàn bộ.

6. ListView.builder() . hiệu suất tốt hơn, các phần tử con chỉ được build khi hiển thị trên màn hình.
   có thuộc tính cacheExtent: giúp mượt hơn

7. ListView.separated() . thêm các dòng kẻ ngăn cách giữa các item con. Có thể xử lý logic
   trong itemBuilder().

8. CustomScrollView() hiển thị các layout phức tạp, hiệu suất cũng ok vì chỉ load dữ liệu khi hiển thị trên màn hình.
   Trong CustomScrollView, có thể hiển thị cả danh sách listview, gridview sử dụng trong :
   SliverGrid or SliverList bên dưới SliverAppBar.

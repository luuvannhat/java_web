<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import thư viện spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<div class="block">
	<sf:form modelAttribute="productaddModel"
		action="${base }/admin/productadd-spring-form" method="POST"
		enctype="multipart/form-data">
		<table class="form">

			<tr>
				<td><label>Product Id</label></td>
				<td><sf:input path="id" id="productId"
						placeholder="Enter Product Name..." class="medium"></sf:input></td>
			</tr>
			<tr>
				<td><label>Category</label></td>
				<td><sf:select path="categories.id" id="category">
						<sf:options items="${categories }" itemValue="id" itemLabel="name" />
					</sf:select></td>
			</tr>
			<tr>
				<td><label>Title</label></td>
				<td><sf:input path="title" id="select" name="title"></sf:input></td>
			</tr>
			<tr>
				<td><label>Price</label></td>
				<td><sf:input path="price" name="price"
						placeholder="Enter Price..." class="medium"></sf:input></td>
			</tr>
			<tr>
				<td><label>Price Sale</label></td>
				<td><sf:input path="priceSale" name="priceSale"
						placeholder="Enter Price..." class="medium"></sf:input></td>
			</tr>
			<tr>
				<td style="vertical-align: top; padding-top: 9px;"><label>Description</label>
				</td>
				<td><sf:textarea path="shortDes" name="shortDes"
						class="tinymce"></sf:textarea></td>
			</tr>
			<tr>
				<td style="vertical-align: top; padding-top: 9px;"><label>Details</label>
				</td>
				<td><sf:textarea path="details" id="summernote" name="editordata"></sf:textarea></td>
			</tr>
			<tr>
				<td><label for="fileProductAvatar">Avatar</label></td>
				<td><input type="file" id="fileProductAvatar"
					name="productAvatar"></td>
			</tr>
			<tr>
				<td></td>
				<td><img alt="" style="width: 100px; height: 100px;"
					src="${base }/upload/${productaddModel.avatar}"></td>
			</tr>
			<tr>
				<td><label for="fileProductPictures">Picture</label></td>
				<td><input type="file" id="fileProductPictures"
					name="productPictures" multiple="multiple"></td>
			</tr>
			<tr>
				<td></td>
				<td><c:forEach items="${productaddModel.productImages}"
						var="productImages">
						<img alt="" style="width: 100px; height: 100px;"
							src="${base }/upload/${productImages.path}">
					</c:forEach></td>
			</tr>
			<tr>
				<td><label>Is Hot</label></td>
				<td><sf:checkbox path="isHot" name="isHot"></sf:checkbox></td>
			</tr>

			<tr>
				<td></td>
				<td><button>Save</button></td>
			</tr>
		</table>
	</sf:form>

</div>




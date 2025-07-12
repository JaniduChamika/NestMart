/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.Brand;
import com.jiat.nestmart.entity.Product;
import com.jiat.nestmart.entity.SubCategory;
import com.jiat.nestmart.entity.Vendor;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.Status;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class ProductDao {

    private EntityManager em;

    public ProductDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public void createProduct(Product product) {
        try {
            if (product.getCreatedAt() == null) {
                product.setCreatedAt(new Date());
            }
            em.getTransaction().begin();
            em.persist(product);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Product getProductById(int id) {
        return em.find(Product.class, id);
    }

    public void updateProduct(Product product) {

        try {
            product.setUpdatedAt(new Date());
            em.getTransaction().begin();
            em.merge(product);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {

        try {
            em.getTransaction().begin();
            Product product = em.find(Product.class, id);
            if (product != null) {
                em.remove(product);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public List<Product> getAllProducts() {
        try {
            TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p", Product.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public List<Product> getAllProducts(int size) {
        try {
            TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p ORDER BY p.createdAt DESC", Product.class);
            query.setMaxResults(size);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public List<Product> getAllProductsByStatus(Status status) {
        try {
            TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p WHERE p.status = :status ", Product.class);
            query.setParameter("status", status);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public List<Product> getProductsByVendor(Vendor vendor) {
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p WHERE p.vendor = :vendor", Product.class);
            query.setParameter("vendor", vendor);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return an empty list on error
        }
    }

    public List<Product> getProductsByVendor(Vendor vendor, Status status) {
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p WHERE p.vendor = :vendor AND p.status = :status ",
                    Product.class);
            query.setParameter("vendor", vendor);
            query.setParameter("status", status);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return an empty list on error
        }
    }

    public void updateProductStatus(int productId, Status status) {
        try {
            em.getTransaction().begin();
            Product item = em.find(Product.class, productId);
            if (item != null) {
                item.setStatus(status);
                em.merge(item);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<Product> getProductsBySubCategory(SubCategory subCategory) {
        TypedQuery<Product> query = em.createQuery(
                "SELECT p FROM Product p WHERE p.subCategory = :subCategory",
                Product.class
        );
        query.setParameter("subCategory", subCategory);

        try {
            return query.getResultList();
        } catch (Exception e) {
            return List.of();
        }
    }

    public List<Product> getProductsBySubCategory(SubCategory subCategory, int size) {
        TypedQuery<Product> query = em.createQuery(
                "SELECT p FROM Product p WHERE p.subCategory = :subCategory ORDER BY p.createdAt DESC",
                Product.class
        );
        query.setParameter("subCategory", subCategory);
        query.setMaxResults(size);
        try {
            return query.getResultList();
        } catch (Exception e) {
            return List.of();
        }
    }

    public List<Product> searchProducts(Integer categoryId, List<Integer> subCategoryId, String name, List<Integer> brandId, Double minPrice, Double maxPrice, String sortby) {
        StringBuilder jpql = new StringBuilder("SELECT p FROM Product p WHERE 1=1");
        Map<String, Object> parameters = new HashMap<>();

        // Add filters dynamically
        if (categoryId != null) {
            jpql.append(" AND p.subCategory.category.id = :categoryId");
            parameters.put("categoryId", categoryId);
        }
        if (subCategoryId != null) {
            jpql.append(" AND p.subCategory.id IN :subCategoryId");
            parameters.put("subCategoryId", subCategoryId);
        }
        if (brandId != null) {
            jpql.append(" AND p.brand.id IN :brand");
            parameters.put("brand", brandId);
        }
        if (name != null && !name.trim().isEmpty()) {
            jpql.append(" AND LOWER(p.name) LIKE :name OR LOWER(p.brand.name) LIKE :name");
            parameters.put("name", "%" + name.trim().toLowerCase() + "%");
        }
        if (minPrice != null) {
            jpql.append(" AND p.price >= :minPrice");
            parameters.put("minPrice", minPrice);
        }
        if (maxPrice != null) {
            jpql.append(" AND p.price <= :maxPrice");
            parameters.put("maxPrice", maxPrice);
        }
        if (sortby!=null && sortby.endsWith("LH")) {
            jpql.append(" ORDER BY p.price ASC");
        } else if(sortby!=null && sortby.endsWith("HL")) {
            jpql.append(" ORDER BY p.price DESC");
        }

        TypedQuery<Product> query = em.createQuery(jpql.toString(), Product.class);
        for (Map.Entry<String, Object> entry : parameters.entrySet()) {
            query.setParameter(entry.getKey(), entry.getValue());
        }

        try {
            return query.getResultList();
        } catch (Exception e) {
            return List.of();
        }
    }

    public List<Brand> getDistinctBrandsBySubCategories(List<Integer> subCategoryIds) {
        if (subCategoryIds == null || subCategoryIds.isEmpty()) {
            return List.of();
        }

        TypedQuery<Brand> query = em.createQuery(
                "SELECT DISTINCT p.brand FROM Product p WHERE p.subCategory.id IN :subCategoryIds AND p.brand IS NOT NULL",
                Brand.class
        );
        query.setParameter("subCategoryIds", subCategoryIds);

        try {
            return query.getResultList();
        } catch (Exception e) {
            return List.of();
        }
    }
}

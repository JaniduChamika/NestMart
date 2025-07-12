/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.dao;

import com.jiat.nestmart.entity.User;
import com.jiat.nestmart.util.JPAUtill;
import com.jiat.nestmart.util.Role;
import com.jiat.nestmart.util.Status;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author ROG STRIX
 */
public class UserDao {

    private EntityManager em;

    public UserDao() {
        em = JPAUtill.getEntityManagerFactory().createEntityManager();
    }

    public void createUser(User user) {
        try {
            if (user.getCreatedAt() == null) {
                user.setCreatedAt(new Date());
            }
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public Optional<User> getUserByEmail(String email) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
        query.setParameter("email", email);
        try {
            return Optional.of(query.getSingleResult());
        } catch (Exception e) {
//            e.printStackTrace();
            return Optional.empty();
        }
    }

    public User getUserById(int id) {
        return em.find(User.class, id);
    }

    public void updateUser(User user) {

        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void deleteUser(int id) {

        try {
            em.getTransaction().begin();
            User user = em.find(User.class, id);
            if (user != null) {
                em.remove(user);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }

    }

    public List<User> getAllUsers() {
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public List<User> getUsersByStatus(Status status) {
        TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE u.status = :status",
                User.class
        );
        query.setParameter("status", status);

        try {
            return query.getResultList();
        } catch (NoResultException e) {
            return List.of();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public boolean emailExists(String email) {
        return getUserByEmail(email).isPresent();
    }

    public User userAuthentication(String email, String password) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password=:password ", User.class);
        query.setParameter("email", email);
        query.setParameter("password", password);

        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public User adminAuthentication(String email, String password) {
        TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE u.email = :email AND u.password = :password AND u.role = :role",
                User.class
        );
        query.setParameter("email", email);
        query.setParameter("password", password);
        query.setParameter("role", Role.admin);

        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public boolean checkEmailVerified(String email) {
        try {
            Optional<User> user = getUserByEmail(email);
            return user.filter(value -> value.getEmailVerifiedAt() != null).isPresent();
        } catch (NoResultException e) {
            e.printStackTrace();

            return false;
        }
    }

    public boolean checkUserStatus(String email) {
        try {
            Optional<User> user = getUserByEmail(email);
            return user.filter(value -> value.getStatus() == Status.active).isPresent();

        } catch (NoResultException e) {
            e.printStackTrace();

            return false;
        }
    }

    public void close() {
        em.close();
    }
}

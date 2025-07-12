/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jiat.nestmart.entity;

import javax.persistence.*;

/**
 *
 * @author ROG STRIX
 */
@Entity
@Table(name = "user_address")
public class UserAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "address_no", length = 45)
    private String addressNo;

    @Column(name = "line1", length = 100)
    private String line1;

    @Column(name = "line2", length = 100)
    private String line2;

    @ManyToOne
    @JoinColumn(name = "cities_cid")
    private City city;

    @OneToOne
    @JoinColumn(name = "users_id")
    private User user;

    public UserAddress() {

    }

    public UserAddress(int id, String addressNo, String line1, String line2, City city, User user) {
        this.id = id;
        this.addressNo = addressNo;
        this.line1 = line1;
        this.line2 = line2;
        this.city = city;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddressNo() {
        return addressNo;
    }

    public void setAddressNo(String addressNo) {
        this.addressNo = addressNo;
    }

    public String getLine1() {
        return line1;
    }

    public void setLine1(String line1) {
        this.line1 = line1;
    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}

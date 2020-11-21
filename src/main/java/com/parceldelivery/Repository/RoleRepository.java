package com.parceldelivery.Repository;

import com.parceldelivery.Model.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface RoleRepository extends CrudRepository <Role,Integer>{
}

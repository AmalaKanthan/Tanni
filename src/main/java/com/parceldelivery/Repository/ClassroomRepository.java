package com.parceldelivery.Repository;

import com.parceldelivery.Model.Classroom;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClassroomRepository extends CrudRepository<Classroom,Integer> {
    public Classroom findById(int id);
}

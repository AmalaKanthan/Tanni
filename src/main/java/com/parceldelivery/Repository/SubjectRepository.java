package com.parceldelivery.Repository;

import com.parceldelivery.Model.Subject;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubjectRepository extends CrudRepository<Subject,Integer> {
    public Subject findById(int id);
}

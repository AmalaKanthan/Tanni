package com.parceldelivery.Repository;

import com.parceldelivery.Model.AllTimeTable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AllTimetableRepository extends CrudRepository<AllTimeTable,Integer> {
    public List<AllTimeTable> getAllByBatchNumber(String batchNumber);
    public List<AllTimeTable> getAllByLecturer(String lecturer);
    public List<AllTimeTable> getAllBySubject(String subject);
    public List<AllTimeTable> getAllByClassroom(String classroom);

    public AllTimeTable getAllByBatchNumberAndDayAndTime(String batchNumber, String day, String time);
}

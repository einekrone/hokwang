package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.Reservation;

public interface ResvMapper {

	public List<Reservation> getResvList(Reservation resv);
}

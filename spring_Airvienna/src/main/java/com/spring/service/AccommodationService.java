package com.spring.service;

import java.util.List;

import com.spring.domain.AccommodationVO;
import com.spring.domain.Criteria;

public interface AccommodationService {
	public List<AccommodationVO> optionE(Criteria ct);
	public List<AccommodationVO> optionR(Criteria ct);
	public List<AccommodationVO> optionM(Criteria ct);
	public List<AccommodationVO> optionT(Criteria ct);
	public List<AccommodationVO> optionRT(Criteria ct);
	public List<AccommodationVO> optionTM(Criteria ct);
	public List<AccommodationVO> optionRM(Criteria ct);
	public List<AccommodationVO> optionRTM(Criteria ct);
	public List<AccommodationVO> optionR(String region);
}

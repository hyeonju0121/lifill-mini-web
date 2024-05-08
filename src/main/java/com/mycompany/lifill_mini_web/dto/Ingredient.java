package com.mycompany.lifill_mini_web.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Ingredient {

	private int igdno;
	private String prdcode;
	private String igdval;
	
}

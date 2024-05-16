package com.mycompany.lifill_mini_web.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Ingredient {
	private int igdno;
	private String igdval;
	
	private String prdcode;

}

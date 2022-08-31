package com.algorithm.list;

import java.util.LinkedList;
import java.util.List;

public class Test1 {
	public int[] solution(int[] arr) {

//		// 1. 배열로 풀기
//		// 최대값 구하기
//		int max = 0;
//		for (int a : arr)
//			if (a > max)
//				max = a;
//		// 최대값이 몇개인지 확인하기
//		int count = 0;
//		for (int a : arr)
//			if (a == max)
//				count++;
//		// 배열 만들기
//		int[] answer = { count };
//		// 배열에 인덱스 채우기
//		int index = 0;
//		for (int i = 0; i < arr.length; i++) {
//			if (arr[i] == max)
//				answer[index++] = i;
//		}
//		return answer;

		// 2. List로 풀기
		// 최대값 구하기
		int max = 0;
		for (int a : arr)
			if (a > max)
				max = a;
		// 리스트 만들기
		List<Integer> list = new LinkedList<>();
		// 배열에 인덱스 채우기
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == max)
				list.add(i);
		}
		// 리스트를 배열로 변환
		
		// 1
		int[] answer = new int[list.size()];
		for(int i = 0; i < list.size(); i++) {
			answer[i] = list.get(i);
		}
		
		// 2
		// int[] answer = list.stream().mapToInt(Integer::intValue).toArray();
		
		return answer;
	}
}

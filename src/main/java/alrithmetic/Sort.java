package alrithmetic;

import java.time.temporal.Temporal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/5/1
 * Time:14:55
 * Describe:
 */

public class Sort {
    public static void bubble_sort(int[] nums){
        int temp,i,j;
        int len = nums.length;
        for(i=0;i<len;i++){
            for(j=0;j<len-i-1;j++){
                if(nums[j]>nums[j+1]){
                    temp = nums[j];
                    nums[j] = nums[j+1];
                    nums[j+1] = temp;
                }
            }
        }
    }

    public static void select_sort(int[] nums){
        int i,j;
        int maxIndex=0,max=nums[0];
        int temp,tempIndex;
        int n = nums.length;
        for(i=0;i<n;i++){
            for(j=0;j<n-i;j++){
                if(nums[j]>nums[maxIndex]){
                    max = nums[j];
                    maxIndex = j;
                }
            }
            temp = nums[j-1];
            nums[j-1] = max;
            nums[maxIndex] = temp;
            maxIndex = 0;
            max = nums[0];
        }
    }

    public static void insert_sort(int[] nums){
        int i,j,k;
        int temp,tempIndex;
        int n = nums.length;
        for(i=1;i<n;i++){
            temp = nums[i];
            j = i;
            while(j-1>=0&&nums[j-1]>temp){
                nums[j] = nums[j-1];
                j--;
            }
            nums[j] = temp;
        }
    }

    public static void merge(int[] nums,int start,int end,int[] result){
        int left_length = (end-start+1)/2+1;
        int left_index = start;
        int right_index = start+left_length;
        int result_index = start;
        while(left_index<start+left_length&&right_index<=end){
            if(nums[left_index]<=nums[right_index]){
                result[result_index++] = nums[left_index++];
            }else {
                result[result_index++] = nums[right_index++];
            }
        }
        while(left_index<start+left_length){
            result[result_index++] = nums[left_index++];
        }
        while(right_index<end+1){
            result[result_index++] = nums[right_index++];
        }
    }
    public static void merge_sort(int[] nums,int start,int end,int[] result){
        if(end-start == 1){
            if(nums[start]>nums[end]){
                int temp = nums[start];
                nums[start] = nums[end];
                nums[end] = temp;
            }
            return ;
        }else if(end-start==0){
            return ;
        }else{
            merge_sort(nums,start,(end-start+1)/2+start,result);
            merge_sort(nums,(end-start+1)/2+start+1,end,result);
            merge(nums,start,end,result);
            for(int i = start;i<=end;i++){
                nums[i] = result[i];
            }
        }
    }

    public static void quick_sort(int[] nums, int left, int right){
        if(left>=right){
            return;
        }
        int i,j,base,temp;
        base = nums[left];
        i = left;
        j = right;
        while (i<j){
            while ((nums[j]>=base&&i<j)){
                j--;
            }
            while ((nums[i]<=base&&i<j)){
                i++;
            }
            if(i<j){
                temp = nums[i];
                nums[i] = nums[j];
                nums[j] = temp;
            }
        }
        nums[left] = nums[i];
        nums[i] = base;
        quick_sort(nums,left,i-1);
        quick_sort(nums,i+1,right);
    }

    public static void shell_sort(int[] nums){
        int gap,temp,i,j;
        int n = nums.length;
        for(gap = n/2;gap>0;gap = gap/2){
            for(i=gap;i<n;i++){
                temp = nums[i];
                j = i;
                while (j-gap>=0&&nums[j-gap]>temp){
                    nums[j] = nums[j-gap];
                    j = j-gap;
                }
                nums[j] = temp;
            }
        }
    }

    public static void heapify(int[] nums,int n,int i){
        int temp;
        int max = i;
        int lson = i*2+1;
        int rson = i*2+2;
        if(lson<n&&nums[max]<nums[lson]){
            max = lson;
        }
        if(rson<n&&nums[max]<nums[rson]){
            max = rson;
        }
        if(max!=i){
            temp = nums[max];
            nums[max] = nums[i];
            nums[i] = temp;
            heapify(nums,n,max);
        }
    }
    public static void heap_sort(int[] nums,int n){
        int i,temp;
        for(i=(n-1)/2;i>=0;i--){
            heapify(nums,n,i);
        }
        for(i=n-1;i>0;i--){
            temp = nums[i];
            nums[i] = nums[0];
            nums[0] = temp;
            heapify(nums,i,0);
        }
    }

    public static <K extends Comparable, V extends Comparable> Map<K, V> sortMapByValues(Map<K, V> aMap) {
        HashMap<K, V> finalOut = new LinkedHashMap<>();
        aMap.entrySet()
                .stream()
                .sorted((p1, p2) -> p2.getValue().compareTo(p1.getValue()))
                .collect(Collectors.toList()).forEach(ele -> finalOut.put(ele.getKey(), ele.getValue()));
        return finalOut;
    }
}

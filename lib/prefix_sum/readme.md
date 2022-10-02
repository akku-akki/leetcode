Prefix Sum 
Prefix sum algorithm is mainly used for range query and the complexity of prefix sum algorithm is O(n).

❓Why
🎯 A normal algo takes O(m*n) time to perform m number of queries
to find range sum on n size array.

🎯Prefix sum algorithm takes O(n) time to perform m number of queries 
 to find range sum on n size array.

<!-- SNIPPET
for(int i = 1; i < n ; i++){
    A[i] = A[i] + A[i - 1];
} -->


👌Tips

🟩 
🟩 

💡Hint

🟩 

🗝️Takeaway
🟩 range sum query formula A[i,j] = A[j] - A[i -1].
🟩 it takes O(n) time to calculate prefix sum array of N size array.
🟩 it takes O(1) time to perform range sum query on N size array.


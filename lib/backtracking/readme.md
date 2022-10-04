Properties and Applications
To generalize the characters of backtracking:

💡No Repetition and Completion: It is a systematic generating method that avoids repetitions and missing any possible right solution. This property makes it ideal for solving combinatorial problems such as combination and permutation which requires us to enumerate all possible solutions.
💡Search Pruning: Because the final solution is built incrementally, in the process of working with partial solutions, we can evaluate the partial solution and prune branches that would never lead to the acceptable complete solution: either it is invalid configuration, or it is worse than known possible complete solution

 CODE {}
        def A_n_k(a, n, k, depth, used, curr, ans):
        '''
        Implement permutation of k items out  of n items
        depth: start from 0, and represent the depth of the search
        used: track what items are  in the partial solution from the set of n
        curr: the current partial solution
        ans: collect all the valide solutions
        '''
        if depth == k: #end condition
        ans.append(curr[::]) # use deepcopy because curr is tracking all partial solution, it eventually become []
        return

        for i in range(n):
        if not used[i]:
            # generate the next solution from curr
            curr.append(a[i])
            used[i] = True
            print(curr)
            # move to the next solution
            A_n_k(a, n, k, depth+1, used, curr, ans)
            
            #backtrack to previous partial state
            curr.pop()
            print('backtrack: ', curr)
            used[i] = False
        return 

🤙CALL ABOVE FUNCTION
a = [1, 2, 3]
n = len(a)
ans = [[None]]
used = [False] * len(a)
ans = []
A_n_k(a, n, n, 0, used, [], ans)
print(ans)

🟩OUTPUT
[[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

❓working SUMMARY 
[1]
[1, 2]
[1, 2, 3]
backtrack:  [1, 2]
backtrack:  [1]
[1, 3]
[1, 3, 2]
backtrack:  [1, 3]
backtrack:  [1]
backtrack:  []
[2]
[2, 1]
[2, 1, 3]
backtrack:  [2, 1]
backtrack:  [2]
[2, 3]
[2, 3, 1]
backtrack:  [2, 3]
backtrack:  [2]
backtrack:  []
[3]
[3, 1]
[3, 1, 2]
backtrack:  [3, 1]
backtrack:  [3]
[3, 2]
[3, 2, 1]
backtrack:  [3, 2]
backtrack:  [3]
backtrack:  []

 📖Two Passes
Therefore, we can say backtrack visit these implicit vertices in two passes: First forward pass to build the solution incrementally, second backward pass to backtrack to previous state. We can see within these two passes, the curr list is used as all vertices, and it start with [] and end with []. This is the character of backtracking.

 🎯 Common Technique
# prun
Only works if sort first
In loop traverse, break if curr cannot meets requirement (the rest can neither meet as > curr).
# filter to waive duplicate 
Only works if sort first
In loop traverse, compare curr with stored elm in arr or prev. When ciolating condition, continue as this would be addressed in other time.
# swap
Use in permutation where same elms with different sequence are considered different. In loop traverse, rather than pushing [j] dicrectly, swap i with j and push i. Restore the swap after backtracking. By doing so, target array continues to push elm with different sequence.

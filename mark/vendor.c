#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/fs.h>		// for basic filesystem
#include <linux/proc_fs.h>	// for the proc filesystem
#include <linux/seq_file.h>	// for sequence files
#include <linux/jiffies.h>	// for jiffies
#include <linux/slab.h>		// for kzalloc, kfree
#include <linux/uaccess.h>	// for copy_from_user

// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>

static char *mark = "this centos machine marked by qitas";

//SNStr = (char *)malloc((sizeof(redgexSN)+1) * sizeof(char)); 
/*打开文件*/ 
// FILE *fp;
// fp=fopen("SN.txt","r"); 
// if (NULL == fp)
// {
	// return 1; 
// }
// else
// {
	// fread(redgexSN, sizeof(char), sizeof(redgexSN), fp);  
	// fclose(fp); 
// }


// seq_operations -> show
static int qitas_show(struct seq_file *m, void *v)
{
	seq_printf(m, "%s\n", mark);
	return 0; //!! must be 0, or will show nothing T.T
}

 

// file_operations -> write
static ssize_t qitas_write(struct file *file, const char __user *buffer, size_t count, loff_t *f_pos)
{
	//分配临时缓冲区
	char *tmp = kzalloc((count+1), GFP_KERNEL);
	if (!tmp)	return -ENOMEM;
	//将用户态write的字符串拷贝到内核空间
	//copy_to|from_user(to,from,cnt)
	if (copy_from_user(tmp, buffer, count)) {
		kfree(tmp);
		return -EFAULT;
	}
	//将str的旧空间释放，然后将tmp赋值给str
	kfree(mark);
	mark = tmp;
	return count;
}

// seq_operations -> open
static int qitas_open(struct inode *inode, struct file *file)
{
	return single_open(file, qitas_show, NULL);
}
 

static const struct file_operations qitas_fops = 
{
	.owner		= THIS_MODULE,
	.open		= qitas_open,
	.read		= seq_read,
	.write 		= qitas_write,
	.llseek		= seq_lseek,
	.release	= single_release,
};

// module init

static int __init qitas_init(void)
{
	struct proc_dir_entry* qitas_file;
	qitas_file = proc_create("qitas", 0, NULL, &qitas_fops);
	if (NULL == qitas_file)
	{
	    return -ENOMEM;
	}
	return 0;
}

// module exit
static void __exit qitas_exit(void)
{
	remove_proc_entry("qitas", NULL);
	kfree(mark);
}

module_init(qitas_init);
module_exit(qitas_exit);

MODULE_AUTHOR("aran");
MODULE_LICENSE("GPL");

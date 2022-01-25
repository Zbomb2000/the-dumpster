import tkinter as tk

def center(win):
    """
    centers a tkinter window
    :param win: the main window or Apilevel window to center
        """
    win.update_idletasks()
    width = win.winfo_width()
    frm_width = win.winfo_rootx() - win.winfo_x()
    win_width = width + 2 * frm_width
    height = win.winfo_height()
    titlebar_height = win.winfo_rooty() - win.winfo_y()
    win_height = height + titlebar_height + frm_width
    x = win.winfo_screenwidth() // 2 - win_width // 2
    y = win.winfo_screenheight() // 2 - win_height // 2
    win.geometry('{}x{}+{}+{}'.format(width, height, x, y))
    win.deiconify()

print("[INFO] Displaying window")

# Window properties
window = tk.Tk()
window.title("Window | Program")
# Resizes the window
window.geometry("200x200")
# Centers the window
center(window)

# Closes the window
def onClosing():
    print()
    print("[INFO] Window closed")
    print()
    window.destroy()

# This is a label
label = tk.Label(
    text="This is a label",
)

# This is the quit button to close the window
quit_button = tk.Button(
    text="Close",
    command=onClosing,
    width=10,
    bg="#4d4d4d",
    fg="white",
)

label.pack(side=tk.TOP, pady=(10, 0))
quit_button.pack(side=tk.BOTTOM, pady=(0, 25))

window.protocol("WM_DELETE_WINDOW", onClosing)

window.mainloop()

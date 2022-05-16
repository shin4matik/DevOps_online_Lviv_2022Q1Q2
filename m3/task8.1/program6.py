import platform
import psutil 
my_system = platform.uname()
print(f"System: {my_system.system}")
print(f"Machine: {my_system.machine}")
print(f"Processor: {my_system.processor}")
print(f"Memory :{psutil.virtual_memory()}")
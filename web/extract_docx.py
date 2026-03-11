import docx
import os

def extract_docx_text(file_path, output_path):
    try:
        doc = docx.Document(file_path)
        full_text = []
        for para in doc.paragraphs:
            full_text.append(para.text)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write('\n'.join(full_text))
        print(f"Successfully extracted text to {output_path}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    input_file = r'c:\Users\Admin\Desktop\quan_ly_phong_tro\web\PHÂN TÍCH THIẾT KẾ BAN ĐẦU.docx'
    output_file = r'c:\Users\Admin\Desktop\quan_ly_phong_tro\web\requirements.txt'
    extract_docx_text(input_file, output_file)

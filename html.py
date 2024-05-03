import streamlit as st

# Load HTML content from file
with open('index.html', 'r') as html_file:
    html_content = html_file.read()

# Load CSS content from file
with open('styles.css', 'r') as css_file:
    custom_css = f"<style>{css_file.read()}</style>"

# Load JavaScript content from file
with open('scripts.js', 'r') as js_file:
    custom_js = f"<script>{js_file.read()}</script>"

# Render HTML content
st.markdown(html_content, unsafe_allow_html=True)

# Render custom CSS
st.write(custom_css, unsafe_allow_html=True)

# Render custom JavaScript
st.write(custom_js, unsafe_allow_html=True)

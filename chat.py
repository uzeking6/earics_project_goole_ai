import os
from dotenv import load_dotenv
import streamlit as st
import google.generativeai as genia

load_dotenv()


genia.configure(api_key=os.getenv("GOOGLE_API_KEY"))


# create a function to load gemini pro model and get response

model = genia.GenerativeModel('gemini-pro')

chat = model.start_chat(history=[])


def get_gemini_response(question):
    response = chat.send_message(question, stream=True)
    # Check if response is a string (single iteration)
    if isinstance(response, str):
        return response
    else:
        try:
            # Try to access response.text, which might raise IncompleteIterationError
            return response.text
        except genia.types.generation_types.IncompleteIterationError:
            # If IncompleteIterationError occurs, resolve the response and then access response.text
            response.resolve()
            return response.text


st.set_page_config(page_title="Let's chat")

st.header("Germini chat application")
# initializ session state for chat history if doesn't exist

if 'chat_history' not in st.session_state:
    st.session_state['chat_history'] = []


input = st.text_input('input', key="input")

submit = st.button("keep chating")


if submit and input:
    response = get_gemini_response(input)
    
    # Add user query and response to session chat history
    
    st.session_state['chat_history'].append(('You', input))
    
    st.subheader("The response is")
    
    # Handle both string and stream responses
    if isinstance(response, str):
        st.write(response)
    else:
        for chunk in response:
            st.write(chunk.text)
    
    st.session_state['chat_history'].append(("Bot", response))
        
st.subheader("chat history")

for role, text in st.session_state['chat_history']:
    st.write(f"{role}: {text}")
